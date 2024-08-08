script;

// mod play01A;
// mod play01B;
// mod play01C;
// mod play02;
mod play03;

// use play02::*;

#[inline(never)]
fn main() {
    let mut x_u8 = 0u8;
    let mut x_u64 = 0u64;

    // let _ = ::play01A::play(22);
    // let _ = ::play01B::play(x_u8);
    // let _ = ::play01C::play(x_u64);
    // ::play02::play(S { x: 22 });
    // ::play02::play();
    ::play03::play();
}