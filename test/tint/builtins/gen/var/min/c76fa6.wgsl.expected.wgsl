fn min_c76fa6() {
  var arg_0 = vec4<f32>();
  var arg_1 = vec4<f32>();
  var res : vec4<f32> = min(arg_0, arg_1);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  min_c76fa6();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  min_c76fa6();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  min_c76fa6();
}
