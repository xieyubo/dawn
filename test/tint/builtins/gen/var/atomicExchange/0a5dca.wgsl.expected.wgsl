var<workgroup> arg_0 : atomic<u32>;

fn atomicExchange_0a5dca() {
  var arg_1 = 1u;
  var res : u32 = atomicExchange(&(arg_0), arg_1);
}

@stage(compute) @workgroup_size(1)
fn compute_main() {
  atomicExchange_0a5dca();
}
