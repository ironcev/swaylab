script;

struct Struct {
    x: u64,
    y: u64,
}

fn main() {
    play_01();
    play_02();
}

#[inline(never)]
fn play_01() {
    let x = 112233;
    let _ = forward_u64(x);
}

#[inline(never)]
fn play_02() {
    let x = 112233;
    let _ = forward_ref(&x);
}

#[inline(never)]
fn forward_u64(x: u64) -> u64 {
    x
}

#[inline(never)]
fn forward_ref(x: &u64) -> &u64 {
    x
}

#[inline(never)]
fn poke<T>(_x: T) {}