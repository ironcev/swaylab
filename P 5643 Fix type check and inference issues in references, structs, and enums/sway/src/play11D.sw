library;

use ::lib_a::Struct;

pub fn play() {
   let s: Struct<Option<u8>> = Struct { x: Option::Some(123) };
   match s.x {
       Some(x) => assert(x == 123u8),
       None => assert(false),
   };
}
