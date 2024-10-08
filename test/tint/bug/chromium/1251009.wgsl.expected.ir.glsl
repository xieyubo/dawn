#version 310 es


struct tint_push_constant_struct {
  uint tint_first_instance;
};

struct VertexInputs0 {
  uint vertex_index;
  int loc0;
};

struct VertexInputs1 {
  uint loc1;
  vec4 loc3;
};

layout(location = 0) uniform tint_push_constant_struct tint_push_constants;
layout(location = 0) in int tint_symbol_loc0_Input;
layout(location = 1) in uint tint_symbol_loc1_Input;
layout(location = 2) in uint tint_symbol_loc2_Input;
layout(location = 3) in vec4 tint_symbol_loc3_Input;
vec4 tint_symbol_inner(VertexInputs0 inputs0, uint loc1, uint instance_index, VertexInputs1 inputs1) {
  uint foo = (inputs0.vertex_index + instance_index);
  return vec4(0.0f);
}
void main() {
  uint v = uint(gl_VertexID);
  VertexInputs0 v_1 = VertexInputs0(v, tint_symbol_loc0_Input);
  uint v_2 = tint_symbol_loc1_Input;
  uint v_3 = uint(gl_InstanceID);
  gl_Position = tint_symbol_inner(v_1, v_2, v_3, VertexInputs1(tint_symbol_loc2_Input, tint_symbol_loc3_Input));
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  gl_PointSize = 1.0f;
}
