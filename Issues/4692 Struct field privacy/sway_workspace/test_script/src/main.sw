script;

mod lib01;
mod lib02;
mod test;

use lib01::*;
use lib01::lib01_nested::*;

use lib02::*;
use lib02::lib02_nested::*;

use test_lib::*;

struct ScriptLocalStruct {
    pub x: u64,
    y: u64,
}

fn main() {
    let _ = Lib01PublicStruct { x: 0, y: 0 };
    let _ = Lib01PublicNestedStruct { x: 0, y: 0 };

    let _ = Lib02PublicStruct { x: 0, y: 0 };
    let _ = Lib02PublicNestedStruct { x: 0, y: 0 };

    let local = ScriptLocalStruct { x: 0, y: 0 };
    poke(local.x);
    poke(local.y);

    ::test::test_me();

    ::lib01::use_me();
    ::lib01::lib01_nested::use_me();
    ::lib02::use_me();
    ::lib02::lib02_nested::use_me();

    test_lib::use_me();
}

fn poke<T>(_x: T) { }