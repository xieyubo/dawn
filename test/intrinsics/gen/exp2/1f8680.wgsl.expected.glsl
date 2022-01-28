#version 310 es
precision mediump float;

void exp2_1f8680() {
  vec3 res = exp2(vec3(0.0f, 0.0f, 0.0f));
}

vec4 vertex_main() {
  exp2_1f8680();
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

void exp2_1f8680() {
  vec3 res = exp2(vec3(0.0f, 0.0f, 0.0f));
}

void fragment_main() {
  exp2_1f8680();
}

void main() {
  fragment_main();
  return;
}
#version 310 es
precision mediump float;

void exp2_1f8680() {
  vec3 res = exp2(vec3(0.0f, 0.0f, 0.0f));
}

void compute_main() {
  exp2_1f8680();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
