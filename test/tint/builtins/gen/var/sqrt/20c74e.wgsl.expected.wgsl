fn sqrt_20c74e() {
  var arg_0 = 1.0;
  var res : f32 = sqrt(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  sqrt_20c74e();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  sqrt_20c74e();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  sqrt_20c74e();
}
