script;

mod lib;

// BEGIN: Idiomatic names imported via non-idiomatic alias.
use lib::LIB_X as libx;
use lib::LibStruct as LIB_STRUCT;
use lib::LibEnum as lib_enum;
use lib::LibTrait as Lib_Trait;
// END: Idiomatic names imported via non-idiomatic alias.

// BEGIN: Idiomatic names used via non-idiomatic type alias.
use lib::LibStruct;
use lib::LibEnum;
use lib::LibTrait;

type ta_LIB_STRUCT = LibStruct;
type ta_lib_enum = LibEnum;
// type ta_Lib_Trait = LibTrait;
// END: Idiomatic names used via non-idiomatic type alias.

// BEGIN: Declared non-idiomatic names.
const MyConst = 1;

struct MY_STRUCT { }

enum my_enum { }

fn MyFunction() { }

trait mytrait { }
// END: Declared non-idiomatic names.

fn main() {
}
