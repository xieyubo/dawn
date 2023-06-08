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

#include "src/tint/ir/transform/var_for_dynamic_index.h"

#include <utility>

#include "src/tint/ir/builder.h"
#include "src/tint/ir/module.h"
#include "src/tint/switch.h"
#include "src/tint/type/array.h"
#include "src/tint/type/matrix.h"
#include "src/tint/type/pointer.h"
#include "src/tint/type/struct.h"
#include "src/tint/type/vector.h"
#include "src/tint/utils/hashmap.h"

TINT_INSTANTIATE_TYPEINFO(tint::ir::transform::VarForDynamicIndex);

using namespace tint::number_suffixes;  // NOLINT

namespace tint::ir::transform {

namespace {
// An access that needs replacing.
struct AccessToReplace {
    // The access instruction.
    Access* access = nullptr;
    // The index of the first dynamic index.
    uint32_t first_dynamic_index = 0;
    // The object type that corresponds to the source of the first dynamic index.
    const type::Type* dynamic_index_source_type = nullptr;
};

// A partial access chain that uses constant indices to get to an object that will be
// dynamically indexed.
struct PartialAccess {
    // The base object.
    Value* base = nullptr;
    // The list of constant indices to get from the base to the source object.
    utils::Vector<Value*, 4> indices;

    // A specialization of utils::Hasher for PartialAccess.
    struct Hasher {
        inline std::size_t operator()(const PartialAccess& src) const {
            return utils::Hash(src.base, src.indices);
        }
    };

    // An equality helper for PartialAccess.
    bool operator==(const PartialAccess& other) const {
        return base == other.base && indices == other.indices;
    }
};
}  // namespace

VarForDynamicIndex::VarForDynamicIndex() = default;

VarForDynamicIndex::~VarForDynamicIndex() = default;

static std::optional<AccessToReplace> ShouldReplace(Access* access) {
    AccessToReplace to_replace{access, 0, access->Object()->Type()};

    // Find the first dynamic index, if any.
    bool has_dynamic_index = false;
    for (auto* idx : access->Indices()) {
        if (to_replace.dynamic_index_source_type->Is<type::Vector>()) {
            // Stop if we hit a vector, as they can support dynamic accesses.
            break;
        }

        // Check if the index is dynamic.
        auto* const_idx = idx->As<Constant>();
        if (!const_idx) {
            has_dynamic_index = true;
            break;
        }
        to_replace.first_dynamic_index++;

        // Update the current object type.
        to_replace.dynamic_index_source_type = tint::Switch(
            to_replace.dynamic_index_source_type,  //
            [&](const type::Array* arr) { return arr->ElemType(); },
            [&](const type::Matrix* mat) { return mat->ColumnType(); },
            [&](const type::Struct* str) {
                return str->Members()[const_idx->Value()->ValueAs<u32>()]->Type();
            },
            [&](const type::Vector* vec) { return vec->type(); },  //
            [&](Default) { return nullptr; });
    }
    if (!has_dynamic_index) {
        // No need to modify accesses that only use constant indices.
        return {};
    }

    return to_replace;
}

void VarForDynamicIndex::Run(ir::Module* ir, const DataMap&, DataMap&) const {
    ir::Builder builder(*ir);

    // Find the access instructions that need replacing.
    utils::Vector<AccessToReplace, 4> worklist;
    for (auto* inst : ir->values.Objects()) {
        auto* access = inst->As<Access>();
        if (access && !access->Type()->Is<type::Pointer>()) {
            if (auto to_replace = ShouldReplace(access)) {
                worklist.Push(to_replace.value());
            }
        }
    }

    // Replace each access instruction that we recorded.
    utils::Hashmap<Value*, Value*, 4> object_to_local;
    utils::Hashmap<PartialAccess, Value*, 4, PartialAccess::Hasher> source_object_to_value;
    for (const auto& to_replace : worklist) {
        auto* access = to_replace.access;
        Value* source_object = access->Object();

        // If the access starts with at least one constant index, extract the source of the first
        // dynamic access to avoid copying the whole object.
        if (to_replace.first_dynamic_index > 0) {
            PartialAccess partial_access = {
                access->Object(), access->Indices().Truncate(to_replace.first_dynamic_index)};
            source_object = source_object_to_value.GetOrCreate(partial_access, [&]() {
                auto* intermediate_source = builder.Access(to_replace.dynamic_index_source_type,
                                                           source_object, partial_access.indices);
                intermediate_source->InsertBefore(access);
                return intermediate_source;
            });
        }

        // Declare a local variable and copy the source object to it.
        auto* local = object_to_local.GetOrCreate(source_object, [&]() {
            auto* decl = builder.Var(ir->Types().pointer(to_replace.dynamic_index_source_type,
                                                         builtin::AddressSpace::kFunction,
                                                         builtin::Access::kReadWrite));
            decl->SetInitializer(source_object);
            decl->InsertBefore(access);
            return decl;
        });

        // Create a new access instruction using the local variable as the source.
        utils::Vector<Value*, 4> indices{access->Indices().Offset(to_replace.first_dynamic_index)};
        auto* new_access =
            builder.Access(ir->Types().pointer(access->Type(), builtin::AddressSpace::kFunction,
                                               builtin::Access::kReadWrite),
                           local, indices);
        access->ReplaceWith(new_access);

        // Load from the access to get the final result value.
        auto* load = builder.Load(new_access);
        load->InsertAfter(new_access);

        // Replace all uses of the old access instruction with the loaded result.
        access->ReplaceAllUsesWith([&](Usage) { return load; });
    }
}

}  // namespace tint::ir::transform
