@group(1) @binding(0) var arg_0 : texture_depth_multisampled_2d;

fn textureLoad_6273b1() {
  var arg_1 = vec2<i32>();
  var arg_2 = 1;
  var res : f32 = textureLoad(arg_0, arg_1, arg_2);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_6273b1();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureLoad_6273b1();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureLoad_6273b1();
}
