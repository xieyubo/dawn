fn degrees_0d170c() {
  var arg_0 = vec4<f32>();
  var res : vec4<f32> = degrees(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  degrees_0d170c();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  degrees_0d170c();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  degrees_0d170c();
}
