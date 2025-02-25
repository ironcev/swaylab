script;

use std::constants::*;

#[deprecated]
struct S {}

#[deprecated]
const C: u8 = 0;

fn main() {
    log(ZERO_B256);
    let _ = S {};
    let _ = C;
    g();
}

fn f(_s: S) {}

fn g() -> S {
    S {}
}