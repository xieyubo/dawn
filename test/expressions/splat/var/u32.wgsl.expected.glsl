#version 310 es
precision mediump float;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void unused_entry_point() {
  return;
}
void f() {
  uint v = (1u + 2u);
  uvec2 v2 = uvec2(v);
  uvec3 v3 = uvec3(v);
  uvec4 v4 = uvec4(v);
}

