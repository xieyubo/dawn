#version 310 es
precision mediump float;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void unused_entry_point() {
  return;
}
struct S {
  int i;
  uint u;
  float f;
  bool b;
};

void f() {
  S v = S(0, 0u, 0.0f, false);
}

