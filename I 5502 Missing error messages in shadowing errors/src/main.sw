script;

mod lib;

use lib::Struct;
use lib::Struct;
use lib::Struct;

const X = 0;

fn main() -> () {
    let X = 1;
    let X = 2;

    let y = 3;

    {
        const y = 4;
    }

    {
        const y = 6;
    }
}

fn generic<T, T, T>(_x: T) { }