script;

// mod play01;
// mod play02A;
// mod play02B;
// mod play02C;
// mod play02D;
// mod play03;
// mod play04;
// mod play05;
// mod play06;
mod play07;

fn main(b: bool) {
    // ::play01::play(b);
    // ::play02A::play(b);
    // ::play02B::play(b);
    // ::play02C::play(b);
    // ::play02D::play(b);
    // ::play03::play(b);
    // ::play04::play(b);
    // ::play05::play(b);
    // ::play06::play(b);
    ::play07::play(b);

    play(b);
}

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x: u64 = if b {
        return 55;
    } else {
        return 11;
    };

    return x;
}