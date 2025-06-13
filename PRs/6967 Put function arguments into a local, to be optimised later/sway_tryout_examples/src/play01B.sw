library;

#[inline(never)]
pub fn play() {
    let x = 5;
    let mut y = 0;
    let _ = fn_with_ref(&x, &mut y, &(111, 222));
}

#[inline(never)]
fn fn_with_ref(x: &u64, y: &mut u64, z: &(u64, u64)) -> u64 {
    let r_x = &x;
    let r_y = &y;
    let r_z = &z;

    **r_y = **r_x + r_z.0;

    **r_x
}