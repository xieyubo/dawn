#version 310 es
precision mediump float;

uniform highp samplerCube arg_0_arg_1;

void textureSample_ea7030() {
  float res = texture(arg_0_arg_1, vec3(0.0f, 0.0f, 0.0f)).x;
}

void fragment_main() {
  textureSample_ea7030();
}

void main() {
  fragment_main();
  return;
}
