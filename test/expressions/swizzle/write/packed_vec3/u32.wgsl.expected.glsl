#version 310 es
precision mediump float;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void unused_entry_point() {
  return;
}
struct S {
  uvec3 v;
};

layout(binding = 0) buffer S_1 {
  uvec3 v;
} U;
void f() {
  U.v = uvec3(1u, 2u, 3u);
  U.v.x = 1u;
  U.v.y = 2u;
  U.v.z = 3u;
}

