library;

use std::bytes::*;

struct S {}

impl S {
    fn method_with_args(self, _a: b256, _b: b256) {}
}

pub fn global_fn_with_method_with_args() {
    let bytes_in_method_arg_a = Bytes::new();
    let bytes_in_method_arg_b = Bytes::new();

    S {}
        .method_with_args(
            b256::from(bytes_in_method_arg_a),
            b256::from(bytes_in_method_arg_b),
        );
}
