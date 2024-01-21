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

use lib::NameClashStruct; // Let's import this explicitly to provoke a name clash.

pub struct NameClashStruct {
    x: u64,
    y: u64,
}

enum Enum {
    A: (),
    B: (),
}

use lib::Enum as EnumAlias; // Let's import this explicitly to provoke a name clash.

enum EnumAlias {
    A: (),
    B: (),
}

pub const X: bool = true;

fn access_struct(s: Struct) {
   log(s.y); // ERROR: Field "y" not found on struct "Struct". Available fields are: x
}

fn access_enum(e: Enum) {
   match e {
      Enum::B => log(e), // ERROR: Variant "B" does not exist on enum "Enum"
      _ => (),
   };
}

fn main() {
   let _ = Struct { x: 0, y: 0 }; // ERROR: Struct "Struct" does not have field "y".
   let _ = PubStruct { x: 0, y: 0 }; // ERROR: Struct "PubStruct" does not have field "y".
   let _ = GenericStruct { x: 0, y: 0 }; // ERROR: Struct "GenericStruct" does not have field "y".
   let _ = NameClashStruct { x: 0, y: 0 }; // ERROR: Struct "NameClashStruct" does not have field "y".
   let _ = Enum::B; // ERROR: Variant "B" does not exist on enum "Enum"
   let _ = EnumAlias::B; // ERROR: Variant "B" does not exist on enum "EnumAlias"
   let _: bool = X; // ERROR: Mismatched types.

   // As expected, if all the items in the "lib" are private the
   // local ones are properly resolved.
}
