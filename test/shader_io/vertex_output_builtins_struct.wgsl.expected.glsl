#version 310 es
precision mediump float;

struct VertexOutputs {
  vec4 position;
};

VertexOutputs tint_symbol() {
  VertexOutputs tint_symbol_1 = VertexOutputs(vec4(1.0f, 2.0f, 3.0f, 4.0f));
  return tint_symbol_1;
}

void main() {
  VertexOutputs inner_result = tint_symbol();
  gl_Position = inner_result.position;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
