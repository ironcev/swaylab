library;

pub fn public_fn(ref mut x: u8) {}

fn private_fn(ref mut x: u64) {}

fn fn_a(ref mut x: u64) {}

fn fn_b(ref mut x: u64) { /* Comment. */ }

fn fn_c(ref mut x: u64, ref mut y: u8) {}

fn fn_d(ref mut x: u64, ref mut y: u8, ref mut z: u8) {}

fn fn_e(ref mut x: u64, y: u8, ref mut z: u8) {}
fn empty_function() {}
