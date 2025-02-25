//! This is a multiline module comment.
//! This is the second line.
library;

use core::ops::Eq;

struct S {
    x: u8,
}

struct GS<A, B> {
    x: A,
    y: B,
}

#[allow(deprecated)]
#[allow(dead_code)]
impl Eq for S {
    fn eq(self, other: Self) -> bool {
        self.x == other.x
    }
}

impl<A> Eq for GS<A, u64> {
    fn eq(self, other: Self) -> bool {
        true
    }
}

impl<A, B, C> Eq for (A, B, C)
where
    A: Eq,
    B: AbiEncode + Eq,
    C: AbiEncode,
{
    fn eq(self, other: Self) -> bool {
        self.0 == other.0 && self.1 == other.1
    }
}

enum E {
    A: (),
}

#[cfg(experimental_partial_eq = false)]
impl Eq for E {
    fn eq(self, other: Self) -> bool {
        true
    }
}

#[cfg(experimental_partial_eq = true)]
impl PartialEq for E {
    fn eq(self, other: Self) -> bool {
        true
    }
}

#[cfg(experimental_partial_eq = true)]
impl Eq for E { }

#[inline(never)]
pub fn play() {
    let s = S { x: 0 };
    let gs = GS { x: 0, y: 0 };
    let e = E::A;

    let _ = s == s;
    let _ = gs == gs;
    let _ = e == e;
}
