#version 310 es

mat3 tint_symbol;
void tint_store_and_preserve_padding(inout mat3 target, mat3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
  target[2u] = value_param[2u];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat3 m = mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f));
  tint_store_and_preserve_padding(tint_symbol, mat3(m));
}
