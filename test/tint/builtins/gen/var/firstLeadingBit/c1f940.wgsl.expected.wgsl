fn firstLeadingBit_c1f940() {
  var arg_0 = vec4<i32>();
  var res : vec4<i32> = firstLeadingBit(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  firstLeadingBit_c1f940();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  firstLeadingBit_c1f940();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  firstLeadingBit_c1f940();
}
