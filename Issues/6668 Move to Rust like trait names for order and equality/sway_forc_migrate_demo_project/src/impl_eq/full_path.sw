//! This is a multiline module comment.
//! This is the second line.
library;

struct S {
    x: u8,
}

struct GS<A, B> {
    x: A,
    y: B,
}

impl core::ops::Eq for S {
    fn eq(self, other: Self) -> bool {
        self.x == other.x
    }
}

impl<A> core::ops::Eq for GS<A, u64> {
    fn eq(self, other: Self) -> bool {
        true
    }
}

pub fn play() {
    let s = S { x: 0 };
    let gs = GS { x: 0, y: 0 };

    let _ = s == s;
    let _ = gs == gs;
}

impl<A, B, C> core::ops::Eq for (A, B, C)
where
    A: Eq,
    B: AbiEncode + Eq,
    C: AbiEncode,
{
    fn eq(self, other: Self) -> bool {
        self.0 == other.0 && self.1 == other.1
    }
}