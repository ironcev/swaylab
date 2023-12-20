library;

use core::ops::Eq;
use std::bytes_conversions::*;

trait New {
    fn new() -> Self;
}

impl New for u256 {
    fn new() -> Self {
        let mut bytes = std::bytes::Bytes::with_capacity(32);
        let mut i: u8 = 0;
        while i < 32_u8 {
            bytes.push(32_u8 - i);
            i += 1_u8;
        }
    
        u256::from_le_bytes(bytes)
    }
}

#[inline(always)]
fn reference_local_var_and_value<T>()
    where T: Eq + New
{
    let x = T::new();

    let r_x_1 = &x;
    let r_x_2 = &x;
    let r_val = &T::new();

    let r_x_1_ptr = asm(r: r_x_1) { r: raw_ptr };
    let r_x_2_ptr = asm(r: r_x_2) { r: raw_ptr };
    let r_val_ptr = asm(r: r_val) { r: raw_ptr };

    assert(r_x_1_ptr == r_x_2_ptr);
    assert(r_x_1_ptr != r_val_ptr);

    let r_x_1_ptr_val = r_x_1_ptr.read::<T>();
    let r_x_2_ptr_val = r_x_2_ptr.read::<T>();
    let r_x_val_val = r_val_ptr.read::<T>();

    assert(r_x_1_ptr_val == x);
    assert(r_x_2_ptr_val == x);
    assert(r_x_val_val == T::new());
}

#[inline(never)]
pub fn play() {
    reference_local_var_and_value::<u256>();
}