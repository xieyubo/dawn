@group(1) @binding(0) var arg_0 : texture_storage_2d<rgba16sint, write>;

fn textureStore_9e3ec5() {
  var arg_1 = vec2<i32>();
  var arg_2 = vec4<i32>();
  textureStore(arg_0, arg_1, arg_2);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureStore_9e3ec5();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureStore_9e3ec5();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureStore_9e3ec5();
}
