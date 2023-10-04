// Copyright 2023 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/tint/lang/spirv/writer/common/option_builder.h"

#include "src/tint/utils/containers/hashset.h"

namespace tint::spirv::writer {

bool ValidateBindingOptions(const Options& options, diag::List& diagnostics) {
    tint::Hashset<tint::BindingPoint, 8> seen_wgsl_bindings{};
    tint::Hashset<binding::BindingInfo, 8> seen_spirv_bindings{};

    auto wgsl_seen = [&diagnostics, &seen_wgsl_bindings](const tint::BindingPoint& info) -> bool {
        if (seen_wgsl_bindings.Contains(info)) {
            std::stringstream str;
            str << "Found duplicate WGSL binding point: " << info;

            diagnostics.add_error(diag::System::Writer, str.str());
            return true;
        }
        seen_wgsl_bindings.Add(info);
        return false;
    };

    auto spirv_seen = [&diagnostics,
                       &seen_spirv_bindings](const binding::BindingInfo& info) -> bool {
        if (seen_spirv_bindings.Contains(info)) {
            std::stringstream str;
            str << "Found duplicate SPIR-V binding point: [group: " << info.group
                << ", binding: " << info.binding << "]";
            diagnostics.add_error(diag::System::Writer, str.str());
            return true;
        }
        seen_spirv_bindings.Add(info);
        return false;
    };

    auto valid = [&wgsl_seen, &spirv_seen](const auto& hsh) -> bool {
        for (const auto it : hsh) {
            const auto& src_binding = it.first;
            const auto& dst_binding = it.second;

            if (wgsl_seen(src_binding)) {
                return false;
            }

            if (spirv_seen(dst_binding)) {
                return false;
            }
        }
        return true;
    };

    if (!valid(options.bindings.uniform)) {
        diagnostics.add_note(diag::System::Writer, "When processing uniform", {});
        return false;
    }
    if (!valid(options.bindings.storage)) {
        diagnostics.add_note(diag::System::Writer, "When processing storage", {});
        return false;
    }
    if (!valid(options.bindings.texture)) {
        diagnostics.add_note(diag::System::Writer, "When processing texture", {});
        return false;
    }
    if (!valid(options.bindings.storage_texture)) {
        diagnostics.add_note(diag::System::Writer, "When processing storage_texture", {});
        return false;
    }
    if (!valid(options.bindings.sampler)) {
        diagnostics.add_note(diag::System::Writer, "When processing sampler", {});
        return false;
    }

    for (const auto it : options.bindings.external_texture) {
        const auto& src_binding = it.first;
        const auto& plane0 = it.second.plane0;
        const auto& plane1 = it.second.plane1;
        const auto& metadata = it.second.metadata;

        // Validate with the actual source regardless of what the remapper will do
        if (wgsl_seen(src_binding)) {
            diagnostics.add_note(diag::System::Writer, "When processing external_texture", {});
            return false;
        }

        if (spirv_seen(plane0)) {
            diagnostics.add_note(diag::System::Writer, "When processing external_texture", {});
            return false;
        }
        if (spirv_seen(plane1)) {
            diagnostics.add_note(diag::System::Writer, "When processing external_texture", {});
            return false;
        }
        if (spirv_seen(metadata)) {
            diagnostics.add_note(diag::System::Writer, "When processing external_texture", {});
            return false;
        }
    }

    return true;
}

// The remapped binding data and external texture data need to coordinate in order to put things in
// the correct place when we're done.
//
// When the data comes in we have a list of all WGSL origin (group,binding) pairs to SPIR-V
// (group,binding) pairs in the `uniform`, `storage`, `texture`, and `sampler` arrays.
//
// The `external_texture` array stores a WGSL origin (group,binding) pair for the external textures
// which provide `plane0`, `plane1`, and `metadata` SPIR-V (group,binding) pairs.
//
// If the remapper is run first, then the `external_texture` will end up being moved from the WGSL
// point, or the SPIR-V point (or the `plane0` value). There will also, possibly, have been bindings
// moved aside in order to place the `external_texture` bindings.
//
// If multiplanar runs first, care needs to be taken that when the texture is split and we create
// `plane1` and `metadata` that they do not collide with existing bindings. If they would collide
// then we need to place them elsewhere and have the remapper place them in the correct locations.
//
// # Example
// WGSL:
//   @group(0) @binding(0) var<uniform> u: Uniforms;
//   @group(0) @binding(1) var s: sampler;
//   @group(0) @binding(2) var t: texture_external;
//
// Given that program, Dawn may decide to do the remappings such that:
//   * WGSL u (0, 0) -> SPIR-V (0, 1)
//   * WGSL s (0, 1) -> SPIR-V (0, 2)
//   * WGSL t (0, 2):
//     * plane0 -> SPIR-V (0, 3)
//     * plane1 -> SPIR-V (0, 4)
//     * metadata -> SPIR-V (0, 0)
//
// In this case, if we run binding remapper first, then tell multiplanar to look for the texture at
// (0, 3) instead of the original (0, 2).
//
// If multiplanar runs first, then metadata (0, 0) needs to be placed elsewhere and then remapped
// back to (0, 0) by the remapper. (Otherwise, we'll have two `@group(0) @binding(0)` items in the
// program.)
//
// # Status
// The below method assumes we run binding remapper first. So it will setup the binding data and
// switch the value used by the multiplanar.
void PopulateRemapperAndMultiplanarOptions(const Options& options,
                                           RemapperData& remapper_data,
                                           ExternalTextureOptions& external_texture) {
    auto create_remappings = [&remapper_data](const auto& hsh) {
        for (const auto it : hsh) {
            const BindingPoint& src_binding_point = it.first;
            const binding::Uniform& dst_binding_point = it.second;

            // Bindings which go to the same slot in SPIR-V do not need to be re-bound.
            if (src_binding_point.group == dst_binding_point.group &&
                src_binding_point.binding == dst_binding_point.binding) {
                continue;
            }

            remapper_data.emplace(src_binding_point,
                                  BindingPoint{dst_binding_point.group, dst_binding_point.binding});
        }
    };

    create_remappings(options.bindings.uniform);
    create_remappings(options.bindings.storage);
    create_remappings(options.bindings.texture);
    create_remappings(options.bindings.storage_texture);
    create_remappings(options.bindings.sampler);

    // External textures are re-bound to their plane0 location
    for (const auto it : options.bindings.external_texture) {
        const BindingPoint& src_binding_point = it.first;
        const binding::BindingInfo& plane0 = it.second.plane0;
        const binding::BindingInfo& plane1 = it.second.plane1;
        const binding::BindingInfo& metadata = it.second.metadata;

        BindingPoint plane0_binding_point{plane0.group, plane0.binding};
        BindingPoint plane1_binding_point{plane1.group, plane1.binding};
        BindingPoint metadata_binding_point{metadata.group, metadata.binding};

        // Use the re-bound spir-v plane0 value for the lookup key.
        external_texture.bindings_map.emplace(
            plane0_binding_point,
            ExternalTextureOptions::BindingPoints{plane1_binding_point, metadata_binding_point});

        // Bindings which go to the same slot in SPIR-V do not need to be re-bound.
        if (src_binding_point.group == plane0.group &&
            src_binding_point.binding == plane0.binding) {
            continue;
        }

        remapper_data.emplace(src_binding_point, BindingPoint{plane0.group, plane0.binding});
    }
}

}  // namespace tint::spirv::writer

namespace std {

/// Custom std::hash specialization for tint::spirv::writer::binding::BindingInfo so
/// they can be used as keys for std::unordered_map and std::unordered_set.
template <>
class hash<tint::spirv::writer::binding::BindingInfo> {
  public:
    /// @param info the binding to create a hash for
    /// @return the hash value
    inline std::size_t operator()(const tint::spirv::writer::binding::BindingInfo& info) const {
        return tint::Hash(info.group, info.binding);
    }
};

}  // namespace std
