library;

#[inline(never)]
pub fn play() {
    let a = [123u8, 111u8, 222u8];

    let r_a_0 = &a[0];
    let r_a_1 = &a[1];

    let r_a_0_addr = asm(r: r_a_0) { r: raw_ptr };
    let r_a_1_addr = asm(r: r_a_1) { r: raw_ptr };
    log(r_a_0_addr);
    log(r_a_1_addr);
}
