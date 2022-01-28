#version 310 es
precision mediump float;

shared uint arg_0;
void atomicStore_726882() {
  atomicExchange(arg_0, 1u);
}

void compute_main(uint local_invocation_index) {
  {
    atomicExchange(arg_0, 0u);
  }
  memoryBarrierShared();
  atomicStore_726882();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main(gl_LocalInvocationIndex);
  return;
}
