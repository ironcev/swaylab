library;

use std::bytes::*;

pub fn global_fn_with_if() {
    if true {
        let bytes_in_if_then = Bytes::new();
        let _ = b256::from(bytes_in_if_then);

        Option::Some(0).is_none();
    } else if true {
        let bytes_in_if_else_if = Bytes::new();
        let _ = b256::from(bytes_in_if_else_if);

        Option::Some(0).is_none();
    } else {
        let bytes_in_if_else = Bytes::new();
        let _ = b256::from(bytes_in_if_else);

        Option::Some(0).is_none();
    }
}
