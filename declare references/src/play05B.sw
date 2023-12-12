library;

#[inline(never)]
pub fn play() {
    let a = 1u32 + 2u32;
    let r1 = &a;
    let r2 = &(1u32 + 2u32);
    let r1_addr = asm(r: r1) { r: raw_ptr };
    let r2_addr = asm(r: r2) { r: raw_ptr };
    assert(r1_addr != r2_addr);
}
