fn tan_2f030e() {
  var arg_0 = 1.0;
  var res : f32 = tan(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  tan_2f030e();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  tan_2f030e();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  tan_2f030e();
}
