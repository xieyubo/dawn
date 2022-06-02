#version 310 es

uniform highp sampler3D arg_0_arg_1;

void textureSampleGrad_21402b() {
  vec3 arg_2 = vec3(0.0f);
  vec3 arg_3 = vec3(0.0f);
  vec3 arg_4 = vec3(0.0f);
  vec4 res = textureGrad(arg_0_arg_1, arg_2, arg_3, arg_4);
}

vec4 vertex_main() {
  textureSampleGrad_21402b();
  return vec4(0.0f);
}

void main() {
  gl_PointSize = 1.0;
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
#version 310 es
precision mediump float;

uniform highp sampler3D arg_0_arg_1;

void textureSampleGrad_21402b() {
  vec3 arg_2 = vec3(0.0f);
  vec3 arg_3 = vec3(0.0f);
  vec3 arg_4 = vec3(0.0f);
  vec4 res = textureGrad(arg_0_arg_1, arg_2, arg_3, arg_4);
}

void fragment_main() {
  textureSampleGrad_21402b();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

uniform highp sampler3D arg_0_arg_1;

void textureSampleGrad_21402b() {
  vec3 arg_2 = vec3(0.0f);
  vec3 arg_3 = vec3(0.0f);
  vec3 arg_4 = vec3(0.0f);
  vec4 res = textureGrad(arg_0_arg_1, arg_2, arg_3, arg_4);
}

void compute_main() {
  textureSampleGrad_21402b();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
