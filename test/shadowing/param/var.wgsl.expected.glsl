#version 310 es
precision mediump float;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void unused_entry_point() {
  return;
}
void f(int a) {
  {
    int a_1 = a;
    int b = a_1;
  }
}

