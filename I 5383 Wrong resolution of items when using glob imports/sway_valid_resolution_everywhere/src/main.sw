script;

mod lib;

use lib::*;

struct Struct {
   x: u64,
   y: u64,
}

pub struct PubStruct {
   x: u64,
   y: u64,
}

struct GenericStruct<T> {
    x: T,
    y: u64,
}

enum Enum {
    A: (),
    B: (),
}

pub const X: bool = true;

fn access_struct(s: Struct) {
   poke(s.y);
}

fn access_enum(e: Enum) {
   match e {
      Enum::B => poke(e),
      Enum::C => poke(e),
      _ => (),
   };
}

fn main() {
   let s = Struct { x: 0, y: 0 };
   let gs = GenericStruct { x: 0, y: 0 };
   let e = Enum::B;
   let _: bool = X;

   poke(s.z);
   poke(gs.z);
}

fn poke<T>(_x: T) { }
