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

var<workgroup> arg_0: atomic<i32>;

// fn atomicXor(ptr<workgroup, atomic<i32>, read_write>, i32) -> i32
fn atomicXor_75dc95() {
  var arg_1 = 1;
  var res: i32 = atomicXor(&arg_0, arg_1);
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  atomicXor_75dc95();
}
