fn countTrailingZeros_42fed6() {
  var arg_0 = 1;
  var res : i32 = countTrailingZeros(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  countTrailingZeros_42fed6();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  countTrailingZeros_42fed6();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  countTrailingZeros_42fed6();
}
