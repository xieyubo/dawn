fn mix_6f8adc() {
  var arg_0 = vec2<f32>();
  var arg_1 = vec2<f32>();
  var arg_2 = vec2<f32>();
  var res : vec2<f32> = mix(arg_0, arg_1, arg_2);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  mix_6f8adc();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  mix_6f8adc();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  mix_6f8adc();
}
