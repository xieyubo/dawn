// Copyright 2021 The Tint Authors.
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

////////////////////////////////////////////////////////////////////////////////
// File generated by tools/intrinsic-gen
// using the template:
//   test/tint/builtins/gen/gen.wgsl.tmpl
// and the intrinsic defintion file:
//   src/tint/intrinsics.def
//
// Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

@group(1) @binding(0) var arg_0: texture_1d<u32>;

// fn textureNumLevels(texture: texture_1d<u32>) -> i32
fn textureNumLevels_1e6f3b() {
  var res: i32 = textureNumLevels(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureNumLevels_1e6f3b();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureNumLevels_1e6f3b();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureNumLevels_1e6f3b();
}
