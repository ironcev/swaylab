library;

struct A {
    x: u64,
}

#[inline(never)]
pub fn play() {
    with_ref();
    with_ptr();
}

#[inline(never)]
pub fn with_ref() {
    let a = A { x: 123 };
    let r1 = &a;
    let r1_addr = asm(r: r1) { r: raw_ptr };
    log(r1_addr);
}

#[inline(never)]
pub fn with_ptr() {
    let a = A { x: 123 };
    let r1 = __addr_of(a);
    let r1_addr = asm(r: r1) { r: raw_ptr };
    log(r1_addr);
}