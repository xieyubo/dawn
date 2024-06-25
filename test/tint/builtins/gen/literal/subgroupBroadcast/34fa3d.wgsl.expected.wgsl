enable chromium_experimental_subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<u32>;

fn subgroupBroadcast_34fa3d() -> vec3<u32> {
  var res : vec3<u32> = subgroupBroadcast(vec3<u32>(1u), 1u);
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_34fa3d();
}
