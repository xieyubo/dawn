#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, rgba16i) uniform highp writeonly iimage2D arg_0;
void textureStore_5a2f8f() {
  int arg_1 = 1;
  ivec4 arg_2 = ivec4(1);
  ivec4 v = arg_2;
  imageStore(arg_0, ivec2(arg_1, 0), v);
}
void main() {
  textureStore_5a2f8f();
}
#version 310 es

layout(binding = 0, rgba16i) uniform highp writeonly iimage2D arg_0;
void textureStore_5a2f8f() {
  int arg_1 = 1;
  ivec4 arg_2 = ivec4(1);
  ivec4 v = arg_2;
  imageStore(arg_0, ivec2(arg_1, 0), v);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_5a2f8f();
}
