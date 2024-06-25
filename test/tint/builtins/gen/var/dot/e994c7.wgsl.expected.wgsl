@group(0) @binding(0) var<storage, read_write> prevent_dce : u32;

fn dot_e994c7() -> u32 {
  var arg_0 = vec4<u32>(1u);
  var arg_1 = vec4<u32>(1u);
  var res : u32 = dot(arg_0, arg_1);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = dot_e994c7();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = dot_e994c7();
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
  out.prevent_dce = dot_e994c7();
  return out;
}
