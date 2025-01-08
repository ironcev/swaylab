contract;

storage {
    // field1 in 123: u64 = 0,
    // field1 in 123u64: u64 = 0,
    // field1 in "str": u64 = 0,
    field1 in u256::zero(): u64 = 0,

    // field1 in b256::zero(): u64 = 0,
    // field2 in b256::zero(): u64 = 0,
}
