#version 310 es
precision highp float;
precision highp int;


struct SB_RW_atomic {
  uint arg_0;
};

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  SB_RW_atomic tint_symbol;
} v;
void atomicMin_c67a74() {
  uint arg_1 = 0u;
  uint res = 0u;
  arg_1 = 1u;
  uint x_18 = arg_1;
  uint x_13 = atomicMin(v.tint_symbol.arg_0, x_18);
  res = x_13;
}
void fragment_main_1() {
  atomicMin_c67a74();
}
void main() {
  fragment_main_1();
}
#version 310 es


struct SB_RW_atomic {
  uint arg_0;
};

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  SB_RW_atomic tint_symbol;
} v;
void atomicMin_c67a74() {
  uint arg_1 = 0u;
  uint res = 0u;
  arg_1 = 1u;
  uint x_18 = arg_1;
  uint x_13 = atomicMin(v.tint_symbol.arg_0, x_18);
  res = x_13;
}
void compute_main_1() {
  atomicMin_c67a74();
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main_1();
}
