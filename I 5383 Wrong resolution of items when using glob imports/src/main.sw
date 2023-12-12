script;

mod lib;

use lib::*;

struct Struct {
   x: u64,
   y: u64,
}

fn main() {
   let _s = Struct { x: 0, y: 0 };
}
