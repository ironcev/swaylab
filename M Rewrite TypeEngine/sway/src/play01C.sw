library;

struct S {}

#[inline(never)]
pub fn play() {
    let x = S {};
    {
        let x = S {};
    }
    take_s(x);
}

fn take_s(s: S) -> S {
    s
}