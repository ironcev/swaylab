library;

use std::constants::*;
use std::error_signals::*;

pub struct TestLibStruct {
    x: u64,
    y: u64,
}

pub const TEST_LIB_U64: u64 = 111111;
pub const TEST_LIB_STRUCT: TestLibStruct = TestLibStruct { x: 11, y: 11 };

#[inline(never)]
pub fn get_test_lib_const_addresses() -> (raw_ptr, ) {
    (__addr_of(TEST_LIB_STRUCT), )
}

#[inline(never)]
pub fn get_test_lib_const_references() -> (&u64, &TestLibStruct) {
    (&TEST_LIB_U64, &TEST_LIB_STRUCT)
}

#[inline(never)]
pub fn get_test_lib_std_const_addresses() -> (&u256, &b256) {
    (&ZERO_U256, &ZERO_B256)
}

#[inline(never)]
pub fn get_test_lib_std_const_references() -> (&u64, &u256, &b256) {
    (&FAILED_REQUIRE_SIGNAL, &ZERO_U256, &ZERO_B256)
}