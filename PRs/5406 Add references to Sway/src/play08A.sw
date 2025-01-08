library;

struct S {
    x_u8: u8,
    y_u64: u64,
}

#[inline(never)]
pub fn play() {
    let s = S { x_u8: 123, y_u64: 321 };

    let r_s_x_u8 = &s.x_u8;
    let r_s_y_u64 = &s.y_u64;

    let r_s_x_u8_addr = asm(r: r_s_x_u8) { r: raw_ptr };
    let r_s_y_u64_addr = asm(r: r_s_y_u64) { r: raw_ptr };
    log(r_s_x_u8_addr);
    log(r_s_y_u64_addr);
}
