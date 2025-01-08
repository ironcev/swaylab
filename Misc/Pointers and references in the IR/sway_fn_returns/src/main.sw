script;

// mod play01A;
mod play02A;
mod play03A;

// use ::play02A::*;
use ::play03A::*;

#[inline(never)]
fn main() {
    // let _ = ::play01A::play();
    // let _ = ::play02A::play();
    // let _ = ::play02A::play().x;
    let _ = ::play03A::play().use_me();
}