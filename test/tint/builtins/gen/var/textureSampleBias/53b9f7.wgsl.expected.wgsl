@group(1) @binding(0) var arg_0 : texture_cube<f32>;

@group(1) @binding(1) var arg_1 : sampler;

fn textureSampleBias_53b9f7() {
  var arg_2 = vec3<f32>();
  var arg_3 = 1.0;
  var res : vec4<f32> = textureSampleBias(arg_0, arg_1, arg_2, arg_3);
}

@stage(fragment)
fn fragment_main() {
  textureSampleBias_53b9f7();
}
