// use crate::main::main;
// unresolved import `crate::main`
// could not find `main` in the crate root

// use ::main::main;
// unresolved import `main`
// could not find `main` in the list of imported crates

use crate::fn_in_main;
use crate::main;
use crate::*;

pub fn lib_fn() {
    main();
    fn_in_main();
}
