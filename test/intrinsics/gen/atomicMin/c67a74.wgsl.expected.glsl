#version 310 es
precision mediump float;

struct SB_RW {
  uint arg_0;
};

layout(binding = 0) buffer SB_RW_1 {
  uint arg_0;
} sb_rw;
void atomicMin_c67a74() {
  uint res = atomicMin(sb_rw.arg_0, 1u);
}

void fragment_main() {
  atomicMin_c67a74();
}

void main() {
  fragment_main();
  return;
}
#version 310 es
precision mediump float;

struct SB_RW {
  uint arg_0;
};

layout(binding = 0) buffer SB_RW_1 {
  uint arg_0;
} sb_rw;
void atomicMin_c67a74() {
  uint res = atomicMin(sb_rw.arg_0, 1u);
}

void compute_main() {
  atomicMin_c67a74();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
