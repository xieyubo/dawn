#version 310 es

mat3x2 m = mat3x2(vec2(0.0f, 1.0f), vec2(2.0f, 3.0f), vec2(4.0f, 5.0f));
mat3x2 tint_symbol;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol = mat3x2(m);
}
