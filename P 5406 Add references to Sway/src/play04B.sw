library;

struct A {
    x: u64,
}

#[inline(never)]
pub fn play() {
    let a = A { x: 123 };
    let r1 = &a;
    let r2 = &A { x: 321 };
    let r1_addr = asm(r: r1) { r: raw_ptr };
    let r2_addr = asm(r: r2) { r: raw_ptr };
    assert(r1_addr != r2_addr);
}
