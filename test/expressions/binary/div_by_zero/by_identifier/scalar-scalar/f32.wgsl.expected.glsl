#version 310 es
precision mediump float;

void f() {
  float a = 1.0f;
  float b = 0.0f;
  float r = (a / b);
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f();
  return;
}
