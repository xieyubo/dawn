fn countLeadingZeros_6d4656() {
  var arg_0 = 1;
  var res : i32 = countLeadingZeros(arg_0);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  countLeadingZeros_6d4656();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  countLeadingZeros_6d4656();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  countLeadingZeros_6d4656();
}
