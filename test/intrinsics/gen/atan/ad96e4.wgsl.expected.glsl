#version 310 es
precision mediump float;

void atan_ad96e4() {
  vec2 res = atan(vec2(0.0f, 0.0f));
}

vec4 vertex_main() {
  atan_ad96e4();
  return vec4(0.0f, 0.0f, 0.0f, 0.0f);
}

void main() {
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
#version 310 es
precision mediump float;

void atan_ad96e4() {
  vec2 res = atan(vec2(0.0f, 0.0f));
}

void fragment_main() {
  atan_ad96e4();
}

void main() {
  fragment_main();
  return;
}
#version 310 es
precision mediump float;

void atan_ad96e4() {
  vec2 res = atan(vec2(0.0f, 0.0f));
}

void compute_main() {
  atan_ad96e4();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
