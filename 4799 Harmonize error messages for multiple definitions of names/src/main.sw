script;

mod lib;

struct X {}
enum X {} // The name `X` is defined multiple times
trait X {} // The name `X` is defined multiple times

const X = 1;
const X = 2; // The name `X` is defined multiple times

fn f() {}
fn f() {} // Function "f" was already defined in scope.

//fn fx(fxa: u32, fxa: u32) {} // identifier "fxa" bound more than once in this parameter list

struct S {
    s: u32,
    //s: u32, // struct field "s" already declared
}

impl S {
    const S_X = 1;
    const S_X = 2; // The name `S_X` is defined multiple times

    const s = 1;

    fn s() {}

    fn s_af() {}
    fn s_af() {}

    fn s_m(self) {}
    fn s_m(self) {}
}

enum E {
    e: (),
    //e: (), // enum variant "e" already declared
}

impl E {
    const E_X = 1;
    const E_X = 2; // The name `S_X` is defined multiple times

    const e = 1;

    fn e() {}

    fn e_af() {}
    fn e_af() {}

    fn e_m(self) {}
    fn e_m(self) {}
}

// abi A { // Getting: thread 'main' panicked at 'not yet implemented', sway-core/src/semantic_analysis/ast_node/declaration/abi.rs:78:21
//     //const A_C; // Constant requires type ascription.
//     const A_X: u32;
//     const A_X: u32; // Name "ID" is defined multiple times.
// }

trait T {
    const T_X: u32;
    const T_X: u32; // Name "T_X" is defined multiple times.
}

struct ST {}

impl T for ST {
    const T_X: u32 = 1;
    const T_X: u32 = 2; // Constant "T_X" was already defined in scope.
}

use lib::LibStruct;
struct LibStruct {} // The name `LibStruct` is defined multiple times

use lib::LibStruct as LS;
struct LS {} // The name `LS` is defined multiple times

use lib::LibStruct as LS1;
use lib::LibEnum as LS1; // The name "LS1" shadows another symbol with the same name.

use lib::LibStruct as LS2;
use lib::LibStruct as LS2; // The name "LS2" shadows another symbol with the same name.

use lib::LibStruct as LibEnum;
use lib::LibEnum; // The name "LibEnum" shadows another symbol with the same name.

use lib::LIB_X;
const LIB_X = 1; // The name `LIB_X` is defined multiple times

use lib::LIB_X as LIB_Y;
const LIB_Y = 1; // The name `LIB_Y` is defined multiple times

fn main() {
}