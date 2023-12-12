library;

#[inline(never)]
pub fn play() {
    const A = 1u32 + 2u32;
    const R1 = &A;
    //         ^^ Could not evaluate initializer to a const declaration.
}
