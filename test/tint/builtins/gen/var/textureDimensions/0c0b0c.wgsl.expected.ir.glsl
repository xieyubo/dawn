#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  uint tint_symbol;
} v;
layout(binding = 0, rgba16f) uniform highp writeonly image2D arg_0;
uint textureDimensions_0c0b0c() {
  uint res = uvec2(imageSize(arg_0)).x;
  return res;
}
void main() {
  v.tint_symbol = textureDimensions_0c0b0c();
}
#version 310 es

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  uint tint_symbol;
} v;
layout(binding = 0, rgba16f) uniform highp writeonly image2D arg_0;
uint textureDimensions_0c0b0c() {
  uint res = uvec2(imageSize(arg_0)).x;
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol = textureDimensions_0c0b0c();
}
