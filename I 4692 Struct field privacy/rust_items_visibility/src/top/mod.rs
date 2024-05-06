// use crate::top::middle::use_private_middle_struct;
// use ::crate::top::middle::use_private_middle_struct;
// Syntax Error: The `crate` keyword is only allowed as the first segment of a pat

pub mod middle;

use middle::use_private_middle_struct;

// use play::top::middle::use_private_middle_struct;
// failed to resolve: use of undeclared crate or module `play`

struct PrivateTopStruct {
    x: u64,
    y: u64,
}

const TOP_CONST: u64 = 0;

pub fn use_items_from_middle() {
    use_private_middle_struct();
}