fn ceil_96f597() {
  var arg_0 = vec2<f32>();
  var res : vec2<f32> = ceil(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  ceil_96f597();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  ceil_96f597();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  ceil_96f597();
}
