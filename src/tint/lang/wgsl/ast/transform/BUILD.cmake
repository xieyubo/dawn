# Copyright 2023 The Dawn & Tint Authors
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

################################################################################
# Target:    tint_lang_wgsl_ast_transform
# Kind:      lib
################################################################################
tint_add_target(tint_lang_wgsl_ast_transform lib
  lang/wgsl/ast/transform/add_block_attribute.cc
  lang/wgsl/ast/transform/add_block_attribute.h
  lang/wgsl/ast/transform/add_empty_entry_point.cc
  lang/wgsl/ast/transform/add_empty_entry_point.h
  lang/wgsl/ast/transform/array_length_from_uniform.cc
  lang/wgsl/ast/transform/array_length_from_uniform.h
  lang/wgsl/ast/transform/binding_remapper.cc
  lang/wgsl/ast/transform/binding_remapper.h
  lang/wgsl/ast/transform/builtin_polyfill.cc
  lang/wgsl/ast/transform/builtin_polyfill.h
  lang/wgsl/ast/transform/canonicalize_entry_point_io.cc
  lang/wgsl/ast/transform/canonicalize_entry_point_io.h
  lang/wgsl/ast/transform/clamp_frag_depth.cc
  lang/wgsl/ast/transform/clamp_frag_depth.h
  lang/wgsl/ast/transform/data.cc
  lang/wgsl/ast/transform/data.h
  lang/wgsl/ast/transform/demote_to_helper.cc
  lang/wgsl/ast/transform/demote_to_helper.h
  lang/wgsl/ast/transform/direct_variable_access.cc
  lang/wgsl/ast/transform/direct_variable_access.h
  lang/wgsl/ast/transform/disable_uniformity_analysis.cc
  lang/wgsl/ast/transform/disable_uniformity_analysis.h
  lang/wgsl/ast/transform/expand_compound_assignment.cc
  lang/wgsl/ast/transform/expand_compound_assignment.h
  lang/wgsl/ast/transform/first_index_offset.cc
  lang/wgsl/ast/transform/first_index_offset.h
  lang/wgsl/ast/transform/fold_constants.cc
  lang/wgsl/ast/transform/fold_constants.h
  lang/wgsl/ast/transform/get_insertion_point.cc
  lang/wgsl/ast/transform/get_insertion_point.h
  lang/wgsl/ast/transform/hoist_to_decl_before.cc
  lang/wgsl/ast/transform/hoist_to_decl_before.h
  lang/wgsl/ast/transform/manager.cc
  lang/wgsl/ast/transform/manager.h
  lang/wgsl/ast/transform/multiplanar_external_texture.cc
  lang/wgsl/ast/transform/multiplanar_external_texture.h
  lang/wgsl/ast/transform/offset_first_index.cc
  lang/wgsl/ast/transform/offset_first_index.h
  lang/wgsl/ast/transform/preserve_padding.cc
  lang/wgsl/ast/transform/preserve_padding.h
  lang/wgsl/ast/transform/promote_initializers_to_let.cc
  lang/wgsl/ast/transform/promote_initializers_to_let.h
  lang/wgsl/ast/transform/promote_side_effects_to_decl.cc
  lang/wgsl/ast/transform/promote_side_effects_to_decl.h
  lang/wgsl/ast/transform/push_constant_helper.cc
  lang/wgsl/ast/transform/push_constant_helper.h
  lang/wgsl/ast/transform/remove_continue_in_switch.cc
  lang/wgsl/ast/transform/remove_continue_in_switch.h
  lang/wgsl/ast/transform/remove_phonies.cc
  lang/wgsl/ast/transform/remove_phonies.h
  lang/wgsl/ast/transform/remove_unreachable_statements.cc
  lang/wgsl/ast/transform/remove_unreachable_statements.h
  lang/wgsl/ast/transform/renamer.cc
  lang/wgsl/ast/transform/renamer.h
  lang/wgsl/ast/transform/robustness.cc
  lang/wgsl/ast/transform/robustness.h
  lang/wgsl/ast/transform/simplify_pointers.cc
  lang/wgsl/ast/transform/simplify_pointers.h
  lang/wgsl/ast/transform/single_entry_point.cc
  lang/wgsl/ast/transform/single_entry_point.h
  lang/wgsl/ast/transform/std140.cc
  lang/wgsl/ast/transform/std140.h
  lang/wgsl/ast/transform/substitute_override.cc
  lang/wgsl/ast/transform/substitute_override.h
  lang/wgsl/ast/transform/transform.cc
  lang/wgsl/ast/transform/transform.h
  lang/wgsl/ast/transform/unshadow.cc
  lang/wgsl/ast/transform/unshadow.h
  lang/wgsl/ast/transform/vectorize_scalar_matrix_initializers.cc
  lang/wgsl/ast/transform/vectorize_scalar_matrix_initializers.h
  lang/wgsl/ast/transform/vertex_pulling.cc
  lang/wgsl/ast/transform/vertex_pulling.h
  lang/wgsl/ast/transform/zero_init_workgroup_memory.cc
  lang/wgsl/ast/transform/zero_init_workgroup_memory.h
)

tint_target_add_dependencies(tint_lang_wgsl_ast_transform lib
  tint_api_common
  tint_api_options
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_common
  tint_lang_wgsl_features
  tint_lang_wgsl_program
  tint_lang_wgsl_resolver
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

if(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
################################################################################
# Target:    tint_lang_wgsl_ast_transform_test
# Kind:      test
# Condition: TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER
################################################################################
tint_add_target(tint_lang_wgsl_ast_transform_test test
  lang/wgsl/ast/transform/add_block_attribute_test.cc
  lang/wgsl/ast/transform/add_empty_entry_point_test.cc
  lang/wgsl/ast/transform/array_length_from_uniform_test.cc
  lang/wgsl/ast/transform/binding_remapper_test.cc
  lang/wgsl/ast/transform/builtin_polyfill_test.cc
  lang/wgsl/ast/transform/canonicalize_entry_point_io_test.cc
  lang/wgsl/ast/transform/clamp_frag_depth_test.cc
  lang/wgsl/ast/transform/demote_to_helper_test.cc
  lang/wgsl/ast/transform/direct_variable_access_test.cc
  lang/wgsl/ast/transform/disable_uniformity_analysis_test.cc
  lang/wgsl/ast/transform/expand_compound_assignment_test.cc
  lang/wgsl/ast/transform/first_index_offset_test.cc
  lang/wgsl/ast/transform/fold_constants_test.cc
  lang/wgsl/ast/transform/get_insertion_point_test.cc
  lang/wgsl/ast/transform/helper_test.h
  lang/wgsl/ast/transform/hoist_to_decl_before_test.cc
  lang/wgsl/ast/transform/manager_test.cc
  lang/wgsl/ast/transform/multiplanar_external_texture_test.cc
  lang/wgsl/ast/transform/offset_first_index_test.cc
  lang/wgsl/ast/transform/preserve_padding_test.cc
  lang/wgsl/ast/transform/promote_initializers_to_let_test.cc
  lang/wgsl/ast/transform/promote_side_effects_to_decl_test.cc
  lang/wgsl/ast/transform/push_constant_helper_test.cc
  lang/wgsl/ast/transform/remove_continue_in_switch_test.cc
  lang/wgsl/ast/transform/remove_phonies_test.cc
  lang/wgsl/ast/transform/remove_unreachable_statements_test.cc
  lang/wgsl/ast/transform/renamer_test.cc
  lang/wgsl/ast/transform/robustness_test.cc
  lang/wgsl/ast/transform/simplify_pointers_test.cc
  lang/wgsl/ast/transform/single_entry_point_test.cc
  lang/wgsl/ast/transform/std140_exhaustive_test.cc
  lang/wgsl/ast/transform/std140_f16_test.cc
  lang/wgsl/ast/transform/std140_f32_test.cc
  lang/wgsl/ast/transform/std140_test.cc
  lang/wgsl/ast/transform/substitute_override_test.cc
  lang/wgsl/ast/transform/transform_test.cc
  lang/wgsl/ast/transform/unshadow_test.cc
  lang/wgsl/ast/transform/vectorize_scalar_matrix_initializers_test.cc
  lang/wgsl/ast/transform/vertex_pulling_test.cc
  lang/wgsl/ast/transform/zero_init_workgroup_memory_test.cc
)

tint_target_add_dependencies(tint_lang_wgsl_ast_transform_test test
  tint_api_common
  tint_api_options
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_ast_transform
  tint_lang_wgsl_ast_test
  tint_lang_wgsl_common
  tint_lang_wgsl_features
  tint_lang_wgsl_program
  tint_lang_wgsl_resolver
  tint_lang_wgsl_sem
  tint_lang_wgsl_writer_ir_to_program
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_wgsl_ast_transform_test test
  "gtest"
)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_wgsl_ast_transform_test test
    tint_lang_wgsl_reader
  )
endif(TINT_BUILD_WGSL_READER)

if(TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_lang_wgsl_ast_transform_test test
    tint_lang_wgsl_writer
  )
endif(TINT_BUILD_WGSL_WRITER)

endif(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
if(TINT_BUILD_WGSL_READER)
################################################################################
# Target:    tint_lang_wgsl_ast_transform_fuzz
# Kind:      fuzz
# Condition: TINT_BUILD_WGSL_READER
################################################################################
tint_add_target(tint_lang_wgsl_ast_transform_fuzz fuzz
  lang/wgsl/ast/transform/add_block_attribute_fuzz.cc
  lang/wgsl/ast/transform/add_empty_entry_point_fuzz.cc
  lang/wgsl/ast/transform/array_length_from_uniform_fuzz.cc
  lang/wgsl/ast/transform/binding_remapper_fuzz.cc
  lang/wgsl/ast/transform/builtin_polyfill_fuzz.cc
  lang/wgsl/ast/transform/canonicalize_entry_point_io_fuzz.cc
  lang/wgsl/ast/transform/clamp_frag_depth_fuzz.cc
  lang/wgsl/ast/transform/demote_to_helper_fuzz.cc
  lang/wgsl/ast/transform/zero_init_workgroup_memory_fuzz.cc
)

tint_target_add_dependencies(tint_lang_wgsl_ast_transform_fuzz fuzz
  tint_api_common
  tint_api_options
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_ast_transform
  tint_lang_wgsl_features
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_utils_bytes
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_wgsl_ast_transform_fuzz fuzz
    tint_cmd_fuzz_wgsl_fuzz
  )
endif(TINT_BUILD_WGSL_READER)

endif(TINT_BUILD_WGSL_READER)