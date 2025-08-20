script;

struct S1 { a: u64, b: u64 }

fn main(_x: u64) {
    f1(S1 { a: 111, b: 222 });
}

#[inline(never)]
fn f1(s1: S1) {
    f2(s1);
}

#[inline(never)]
fn f2(s1: S1) {
    poke(s1);
}

#[inline(never)]
fn poke(_s1: S1) {}