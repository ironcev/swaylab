mod lib;

use lib::E as LibE;
use lib::S as LibS;

enum E {
  X(u8),
}

struct S {
  x: u8,
}

fn main() {
    let _: LibE = E::X(123);
    let _: LibS = S { x: 123 };
}
