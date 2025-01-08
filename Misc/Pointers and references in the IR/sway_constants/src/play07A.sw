library;

trait Trait {
    // const C_TRAIT: u64;
    const C_TRAIT: u64 = 110000;
} {
    fn foo() -> u64 {
        Self::C_TRAIT
    }
}

struct S { }

impl Trait for S {
    const C_TRAIT: u64 = 110011;
}

#[inline(never)]
pub fn play() -> u64 {
    S::foo()
}