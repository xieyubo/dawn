fn log2_aea659() {
  var arg_0 = vec2<f32>();
  var res : vec2<f32> = log2(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  log2_aea659();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  log2_aea659();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  log2_aea659();
}
