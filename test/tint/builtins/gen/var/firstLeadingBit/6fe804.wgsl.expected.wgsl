fn firstLeadingBit_6fe804() {
  var arg_0 = vec2<u32>();
  var res : vec2<u32> = firstLeadingBit(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  firstLeadingBit_6fe804();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  firstLeadingBit_6fe804();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  firstLeadingBit_6fe804();
}
