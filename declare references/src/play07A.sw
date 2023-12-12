library;

struct S {
    r_u8: &u8,
}

#[inline(never)]
pub fn play() {
    let x = 123u8;

    let s = S { r_u8: &x };
    //                ^^ Mismatched types.
    // expected: &u8
    // found:    &u8.
    // help: Struct field's type must match the type specified in its declaration.

    let s = S { r_u8: &123u8 };
    //                ^^^^^^ Mismatched types.
    // expected: &u8
    // found:    &u8.
    // help: Struct field's type must match the type specified in its declaration.

    let r_x = &x;
    let s = S { r_u8: r_x };
    //                ^^^ Mismatched types.
    // expected: &u8
    // found:    &u8.
    // help: Struct field's type must match the type specified in its declaration.

    let s_r_u8_addr = asm(r: s.r_u8) { r: raw_ptr };
    log(s_r_u8_addr);
}
