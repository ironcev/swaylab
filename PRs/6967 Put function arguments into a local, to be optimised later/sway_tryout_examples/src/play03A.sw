library;

#[inline(never)]
pub fn play() {
    let t = (111, 222);

    let _ = fn_with_aggregate_arg(t);
}

#[inline(never)]
fn fn_with_aggregate_arg(x: (u64, u64)) -> u64 {
    x.0
}