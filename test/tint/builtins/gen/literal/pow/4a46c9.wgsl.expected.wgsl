@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<f32>;

fn pow_4a46c9() -> vec3<f32> {
  var res : vec3<f32> = pow(vec3<f32>(1.0f), vec3<f32>(1.0f));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = pow_4a46c9();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = pow_4a46c9();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : vec3<f32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = pow_4a46c9();
  return out;
}
