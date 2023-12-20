library;

struct S {
    r_u8: &u8,
}

#[inline(never)]
pub fn play() {
    let x = 123u8;

    let s = S { r_u8: &x };
    let s = S { r_u8: &123u8 };
    let s = S { r_u8: &123 };

    let r_x = &x;
    let s = S { r_u8: r_x };

    let s_r_u8_addr = asm(r: s.r_u8) { r: raw_ptr };
    log(s_r_u8_addr);
}
