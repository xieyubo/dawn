fn select_bb8aae() {
  var arg_0 = vec4<f32>();
  var arg_1 = vec4<f32>();
  var arg_2 = vec4<bool>();
  var res : vec4<f32> = select(arg_0, arg_1, arg_2);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  select_bb8aae();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  select_bb8aae();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  select_bb8aae();
}
