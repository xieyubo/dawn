fn reverseBits_c21bc1() {
  var arg_0 = vec3<i32>();
  var res : vec3<i32> = reverseBits(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  reverseBits_c21bc1();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  reverseBits_c21bc1();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  reverseBits_c21bc1();
}
