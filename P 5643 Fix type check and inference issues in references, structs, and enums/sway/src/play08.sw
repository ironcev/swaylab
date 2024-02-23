library;

use ::lib_a::E as LibE;
use ::lib_a::S as LibS;

enum E {
  X: u8,
  Y: u8,
}

struct S {
  x: u8,
  y: u8,
}


#[inline(never)]
pub fn play() -> u64 {
  let _: LibE = E::X(123);

  let _: LibE = E::Y(123);
  let _: LibS = S { x: 123, y: 123 };

  let _: LibE = LibE::Y(123);
  let _: LibS = LibS { x: 123, y: 123 };
  
  0
}
