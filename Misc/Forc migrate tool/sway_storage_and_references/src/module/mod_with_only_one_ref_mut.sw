library;

pub fn public_fn_no_args() {}

pub fn public_fn(x: u8) {}

fn private_fn(x: u64) {}

fn fn_a(x: u64) {}

fn empty_function(x: u64) {}

fn fn_b(x: u64) {}

fn fn_c(x: u64, y: u8) {}

fn fn_d(x: u64, y: u8, z: u8) {}

fn fn_e(x: u64, y: u8, z: u8) {}

fn only_with(ref mut x: u64) {}
