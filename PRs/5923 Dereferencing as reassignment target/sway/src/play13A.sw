library;

#[inline(never)]
fn function(r_x: &mut u8) -> &mut u8 {
    r_x
}

#[inline(never)]
pub fn play() {
    let mut x = 11u8;

    use_function(0, &mut x);
}

#[inline(never)]
fn use_function(to_use: u8, r_m: &mut u8) {
    let mut x = 11u8;

    if to_use == 0 {
        *function(&mut x) = 22u8;
    } else if to_use == 1 {
        *function(r_m) = 33u8;
    };
}