library;

#[inline(never)]
pub fn play() {
    fn_call_with_reference_variable();
    fn_call_with_direct_reference();
    asm_with_reference_variable();
    asm_with_direct_reference();
}

#[inline(never)]
pub fn asm_with_reference_variable() {
    let x = 1u8;

    let r_x = &x;

    let r_x_ptr = asm(r: r_x) { r: raw_ptr };

    log(r_x_ptr);
}

#[inline(never)]
pub fn asm_with_direct_reference() {
    let x = 1u8;

    let r_x_ptr = asm(r: &x) { r: raw_ptr };

    log(r_x_ptr);
}

#[inline(never)]
pub fn fn_call_with_reference_variable() {
    let x = 1u8;

    let r_x = &x;

    poke(r_x);
}

#[inline(never)]
pub fn fn_call_with_direct_reference() {
    let x = 1u8;

    poke(&x);
}

#[inline(never)]
fn poke<T>(_x: T) { }