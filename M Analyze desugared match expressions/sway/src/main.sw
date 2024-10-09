script;

mod lib;

// mod play01A;
mod play01B;

use lib::*;
use lib::Option::*;

fn main() {
    // play01A::play(Some(Output::Coin), true, false);
    play01B::play(Some(Output::Coin), true, false);
}
