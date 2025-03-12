script;

use std::bytes::*;

fn main() {
    let some_bytes = Bytes::new();
    let _: b256 = some_bytes.into();
    // let _: b256 = some_bytes.try_into().unwrap();
}
