library;

pub struct S {
    pub x: u8,
}

#[inline(never)]
pub fn play(s: S) {
// pub fn play() {
//     let s = S { x: 11 };
    let y = s.x + s.x;
    poke(y);
}

#[inline(never)]
fn poke<T>(_x: T) { }