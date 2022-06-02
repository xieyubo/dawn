@group(1) @binding(1) var arg_1 : texture_cube_array<u32>;

@group(1) @binding(2) var arg_2 : sampler;

fn textureGather_f2c6e3() {
  var arg_3 = vec3<f32>();
  var arg_4 = 1;
  var res : vec4<u32> = textureGather(1, arg_1, arg_2, arg_3, arg_4);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureGather_f2c6e3();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureGather_f2c6e3();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureGather_f2c6e3();
}
