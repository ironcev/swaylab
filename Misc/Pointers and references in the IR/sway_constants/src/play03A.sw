library;

const LIB_CONST: u64 = 333333;

#[inline(never)]
pub fn play() -> u64 {
    LIB_CONST
}
