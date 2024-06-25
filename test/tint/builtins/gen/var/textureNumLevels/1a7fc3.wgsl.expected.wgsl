@group(0) @binding(0) var<storage, read_write> prevent_dce : u32;

@group(1) @binding(0) var arg_0 : texture_1d<u32>;

fn textureNumLevels_1a7fc3() -> u32 {
  var res : u32 = textureNumLevels(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = textureNumLevels_1a7fc3();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = textureNumLevels_1a7fc3();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : u32,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = textureNumLevels_1a7fc3();
  return out;
}
