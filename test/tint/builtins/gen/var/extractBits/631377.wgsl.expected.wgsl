fn extractBits_631377() {
  var arg_0 = vec4<u32>();
  var arg_1 = 1u;
  var arg_2 = 1u;
  var res : vec4<u32> = extractBits(arg_0, arg_1, arg_2);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  extractBits_631377();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  extractBits_631377();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  extractBits_631377();
}
