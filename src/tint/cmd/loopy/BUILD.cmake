# Copyright 2023 The Tint Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

################################################################################
# Target:    tint_cmd_loopy_cmd
# Kind:      cmd
################################################################################
tint_add_target(tint_cmd_loopy_cmd cmd
  cmd/loopy/main.cc
)

tint_target_add_dependencies(tint_cmd_loopy_cmd cmd
  tint_api
  tint_api_common
  tint_api_options
  tint_cmd_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_hlsl_writer_common
  tint_lang_spirv_reader_common
  tint_lang_spirv_writer_helpers
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_helpers
  tint_lang_wgsl_inspector
  tint_lang_wgsl_program
  tint_lang_wgsl_reader
  tint_lang_wgsl_reader_program_to_ir
  tint_lang_wgsl_sem
  tint_lang_wgsl_writer
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

if(TINT_BUILD_GLSL_WRITER)
  tint_target_add_dependencies(tint_cmd_loopy_cmd cmd
    tint_lang_glsl_writer
    tint_lang_glsl_writer_common
  )
endif(TINT_BUILD_GLSL_WRITER)

if(TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies(tint_cmd_loopy_cmd cmd
    tint_lang_hlsl_writer
  )
endif(TINT_BUILD_HLSL_WRITER)

if(TINT_BUILD_MSL_WRITER)
  tint_target_add_dependencies(tint_cmd_loopy_cmd cmd
    tint_lang_msl_writer
    tint_lang_msl_writer_common
  )
endif(TINT_BUILD_MSL_WRITER)

if(TINT_BUILD_SPV_READER)
  tint_target_add_dependencies(tint_cmd_loopy_cmd cmd
    tint_lang_spirv_reader
  )
endif(TINT_BUILD_SPV_READER)

if(TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies(tint_cmd_loopy_cmd cmd
    tint_lang_spirv_writer
    tint_lang_spirv_writer_common
  )
endif(TINT_BUILD_SPV_WRITER)

tint_target_set_output_name(tint_cmd_loopy_cmd cmd "tint_loopy")
