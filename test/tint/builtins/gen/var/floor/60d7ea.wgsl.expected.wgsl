fn floor_60d7ea() {
  var arg_0 = vec3<f32>();
  var res : vec3<f32> = floor(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  floor_60d7ea();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  floor_60d7ea();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  floor_60d7ea();
}
