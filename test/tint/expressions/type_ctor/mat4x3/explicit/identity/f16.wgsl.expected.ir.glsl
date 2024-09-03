#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

f16mat4x3 m = f16mat4x3(f16vec3(0.0hf, 1.0hf, 2.0hf), f16vec3(3.0hf, 4.0hf, 5.0hf), f16vec3(6.0hf, 7.0hf, 8.0hf), f16vec3(9.0hf, 10.0hf, 11.0hf));
f16mat4x3 tint_symbol;
void tint_store_and_preserve_padding(inout f16mat4x3 target, f16mat4x3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
  target[2u] = value_param[2u];
  target[3u] = value_param[3u];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_store_and_preserve_padding(tint_symbol, f16mat4x3(m));
}
