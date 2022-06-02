@group(1) @binding(0) var arg_0 : texture_2d<f32>;

@group(1) @binding(1) var arg_1 : sampler;

fn textureSampleGrad_d4e3c5() {
  var arg_2 = vec2<f32>();
  var arg_3 = vec2<f32>();
  var arg_4 = vec2<f32>();
  var res : vec4<f32> = textureSampleGrad(arg_0, arg_1, arg_2, arg_3, arg_4, vec2<i32>());
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureSampleGrad_d4e3c5();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureSampleGrad_d4e3c5();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureSampleGrad_d4e3c5();
}
