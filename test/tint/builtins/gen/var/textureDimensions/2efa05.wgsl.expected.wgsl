@group(1) @binding(0) var arg_0 : texture_3d<u32>;

fn textureDimensions_2efa05() {
  var arg_1 = 0;
  var res : vec3<i32> = textureDimensions(arg_0, arg_1);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureDimensions_2efa05();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureDimensions_2efa05();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureDimensions_2efa05();
}
