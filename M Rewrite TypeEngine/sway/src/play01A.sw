library;

struct S {}

#[inline(never)]
pub fn play() {
    let _ = S {};
    let _ = S {};
    let _ = S {};
    let _ = S {};

    take_s(S {});
    take_s(S {});
    take_s(S {});
    take_s(S {});
}

#[inline(never)]
fn take_s(s: S) -> S {
    s
}

