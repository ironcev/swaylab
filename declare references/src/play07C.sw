library;

enum E {
    A: &u8,
}

#[inline(never)]
pub fn play() {
    let x = 123u8;

    let e = E::A(&x);
    //           ^^ Mismatched types.
    // expected: &u8
    // found:    &u8.
    // help: Enum instantiator must match its declared variant type.

    let r_x_from_e_a = match e {
        E::A(r) => r,
        _ => &0u8,
    };

    let r_x_from_e_a_addr = asm(r: r_x_from_e_a) { r: raw_ptr };
    log(r_x_from_e_a_addr);
}
