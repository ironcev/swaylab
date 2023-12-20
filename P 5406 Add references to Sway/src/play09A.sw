library;

struct S {
    x_u8: u8,
    y_u64: u64,
}

#[inline(never)]
pub fn play() {
    let s1 = S { x_u8: 11, y_u64: 22 };
    let s2 = S { x_u8: 111, y_u64: 122 };
    let s3 = S { x_u8: 211, y_u64: 222 };

    let a = [s1, s2, s3];

    let r_a_0 = &a[0];
    let r_a_1 = &a[1];

    let r_a_0_from_asm = asm(r: r_a_0) { r: &S };
    let r_a_0_from_asm_addr = asm(r: r_a_0_from_asm) { r: raw_ptr };
    log(r_a_0_from_asm_addr);

    let r_a_0_addr = asm(r: r_a_0) { r: raw_ptr };
    let r_a_1_addr = asm(r: r_a_1) { r: raw_ptr };
    log(r_a_0_addr);
    log(r_a_1_addr);
}
