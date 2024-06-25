enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<f16>;

fn normalize_39d5ec() -> vec3<f16> {
  var res : vec3<f16> = normalize(vec3<f16>(1.0h));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = normalize_39d5ec();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = normalize_39d5ec();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : vec3<f16>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = normalize_39d5ec();
  return out;
}
