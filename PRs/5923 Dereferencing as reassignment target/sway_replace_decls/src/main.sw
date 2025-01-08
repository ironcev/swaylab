script;

// mod play01A;
// mod play02A;
mod play03A;

// use play02A::*;
use play03A::*;

fn main() {
    // let _ = play01A::play();

    // let _ = play02A::play(123);
    // let _ = play02A::play(S { });

    let _ = play03A::play(123);
    let _ = play03A::play(S { });
}
