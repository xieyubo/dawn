intrinsics/gen/isNan/e4978e.wgsl:28:19 warning: use of deprecated intrinsic
  var res: bool = isNan(1.0);
                  ^^^^^

#version 310 es
precision mediump float;

void isNan_e4978e() {
  bool res = isnan(1.0f);
}

vec4 vertex_main() {
  isNan_e4978e();
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

void isNan_e4978e() {
  bool res = isnan(1.0f);
}

void fragment_main() {
  isNan_e4978e();
}

void main() {
  fragment_main();
  return;
}
#version 310 es
precision mediump float;

void isNan_e4978e() {
  bool res = isnan(1.0f);
}

void compute_main() {
  isNan_e4978e();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
