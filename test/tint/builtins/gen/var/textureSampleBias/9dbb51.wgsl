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

@group(1) @binding(0) var arg_0: texture_2d_array<f32>;
@group(1) @binding(1) var arg_1: sampler;

// fn textureSampleBias(texture: texture_2d_array<f32>, sampler: sampler, coords: vec2<f32>, array_index: i32, bias: f32, @const offset: vec2<i32>) -> vec4<f32>
fn textureSampleBias_9dbb51() {
  var arg_2 = vec2<f32>();
  var arg_3 = 1;
  var arg_4 = 1.0;
  var res: vec4<f32> = textureSampleBias(arg_0, arg_1, arg_2, arg_3, arg_4, vec2<i32>());
}

@stage(fragment)
fn fragment_main() {
  textureSampleBias_9dbb51();
}
