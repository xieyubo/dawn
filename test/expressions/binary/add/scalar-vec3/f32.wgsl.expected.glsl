#version 310 es
precision mediump float;

void f() {
  float a = 4.0f;
  vec3 b = vec3(1.0f, 2.0f, 3.0f);
  vec3 r = (a + b);
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f();
  return;
}
