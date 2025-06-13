library;

#[inline(never)]
pub fn play() {
    let mut t = (333, 444);
    let _ = fn_with_mut_ref((111, 222), t);
}

#[inline(never)]
fn fn_with_mut_ref(x: (u64, u64), ref mut y: (u64, u64)) -> u64 {
    y.0 = x.0 + x.1;
    y.1 = x.0 * x.1;

    y.0 + y.1
}