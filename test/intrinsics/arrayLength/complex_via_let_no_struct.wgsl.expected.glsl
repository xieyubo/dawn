SKIP: FAILED

#version 310 es
precision mediump float;

layout(binding = 0) buffer G_block_1 {
  int inner[];
} G;
void tint_symbol() {
  uint tint_symbol_2 = 0u;
  G.inner.GetDimensions(tint_symbol_2);
  uint tint_symbol_3 = (tint_symbol_2 / 4u);
  uint l1 = tint_symbol_3;
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol();
  return;
}
Error parsing GLSL shader:
ERROR: 0:9: '.' : cannot apply to an array: GetDimensions
ERROR: 0:9: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.



