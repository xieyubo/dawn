@group(1) @binding(0) var arg_0 : texture_storage_2d_array<rg32sint, write>;

fn textureStore_f9be83() {
  var arg_1 = vec2<i32>();
  var arg_2 = 1;
  var arg_3 = vec4<i32>();
  textureStore(arg_0, arg_1, arg_2, arg_3);
}

@stage(vertex)
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureStore_f9be83();
  return vec4<f32>();
}

@stage(fragment)
fn fragment_main() {
  textureStore_f9be83();
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  textureStore_f9be83();
}
