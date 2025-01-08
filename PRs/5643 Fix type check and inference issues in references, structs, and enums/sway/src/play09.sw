library;

use ::lib_a::E as LibAE;
use ::lib_a::S as LibAS;

use ::lib_b::E as LibBE;
use ::lib_b::S as LibBS;

#[inline(never)]
pub fn play() -> u64 {
  let _: LibAE = LibBE::X(123);
  let _: LibAS = LibBS { x: 123 };
  
  0
}
