fn pack4x8snorm_4d22e7() {
  var arg_0 = vec4<f32>();
  var res : u32 = pack4x8snorm(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  pack4x8snorm_4d22e7();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  pack4x8snorm_4d22e7();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  pack4x8snorm_4d22e7();
}
