SKIP: FAILED

#version 310 es
precision mediump float;

uniform highp samplerCubeArray arg_0_arg_1;

void textureGather_43025d() {
  vec4 res = textureGather(arg_0_arg_1, vec4(0.0f, 0.0f, 0.0f, float(1)));
}

vec4 vertex_main() {
  textureGather_43025d();
  return vec4(0.0f, 0.0f, 0.0f, 0.0f);
}

void main() {
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
Error parsing GLSL shader:
ERROR: 0:4: 'samplerCubeArray' : Reserved word. 
ERROR: 0:4: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.



#version 310 es
precision mediump float;

uniform highp samplerCubeArray arg_0_arg_1;

void textureGather_43025d() {
  vec4 res = textureGather(arg_0_arg_1, vec4(0.0f, 0.0f, 0.0f, float(1)));
}

void fragment_main() {
  textureGather_43025d();
}

void main() {
  fragment_main();
  return;
}
Error parsing GLSL shader:
ERROR: 0:4: 'samplerCubeArray' : Reserved word. 
ERROR: 0:4: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.



#version 310 es
precision mediump float;

uniform highp samplerCubeArray arg_0_arg_1;

void textureGather_43025d() {
  vec4 res = textureGather(arg_0_arg_1, vec4(0.0f, 0.0f, 0.0f, float(1)));
}

void compute_main() {
  textureGather_43025d();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
Error parsing GLSL shader:
ERROR: 0:4: 'samplerCubeArray' : Reserved word. 
ERROR: 0:4: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.



