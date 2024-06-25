enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f16>;

fn smoothstep_c43ebd() -> vec4<f16> {
  var res : vec4<f16> = smoothstep(vec4<f16>(2.0h), vec4<f16>(4.0h), vec4<f16>(3.0h));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = smoothstep_c43ebd();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = smoothstep_c43ebd();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : vec4<f16>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = smoothstep_c43ebd();
  return out;
}
