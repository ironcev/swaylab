struct S<'a> {
    r_r_x: &'a mut &'a mut u8,
}

pub fn play() {
    let mut x = 0u8;
    let s = S { r_r_x: &mut &mut x };

    **s.r_r_x = 1;
}
