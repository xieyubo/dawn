#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, r32ui) uniform highp uimage2D arg_0;
void textureStore_8676c9() {
  imageStore(arg_0, ivec2(1, 0), uvec4(1u));
}
void main() {
  textureStore_8676c9();
}
#version 310 es

layout(binding = 0, r32ui) uniform highp uimage2D arg_0;
void textureStore_8676c9() {
  imageStore(arg_0, ivec2(1, 0), uvec4(1u));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_8676c9();
}
