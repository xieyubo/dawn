@group(1) @binding(0) var arg_0 : texture_cube_array<f32>;

fn textureDimensions_50a9ee() {
  var arg_1 = 0;
  var res : vec2<i32> = textureDimensions(arg_0, arg_1);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureDimensions_50a9ee();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureDimensions_50a9ee();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureDimensions_50a9ee();
}
