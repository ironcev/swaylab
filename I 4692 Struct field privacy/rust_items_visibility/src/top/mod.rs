use crate::top::middle::use_private_middle_struct;

pub mod middle;

struct PrivateTopStruct {
    x: u64,
    y: u64,
}

const TOP_CONST: u64 = 0;

pub fn use_items_from_middle() {
    use_private_middle_struct();
}