#version 310 es
precision mediump float;

int i = 123;
void tint_symbol() {
  int use = (i + 1);
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol();
  return;
}
