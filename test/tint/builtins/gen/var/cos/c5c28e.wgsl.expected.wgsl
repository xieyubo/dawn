fn cos_c5c28e() {
  var arg_0 = 1.0;
  var res : f32 = cos(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  cos_c5c28e();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  cos_c5c28e();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  cos_c5c28e();
}
