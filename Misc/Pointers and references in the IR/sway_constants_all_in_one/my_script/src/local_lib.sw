library;

pub struct LocalLibStruct {
    pub x: u64,
    pub y: u256,
}

pub const LOCAL_LIB_U64: u64 = 0xff_ff_ff_ff_ff_ff_ff_ddu64;
pub const LOCAL_LIB_U64_IMM: u64 = 333333;
pub const LOCAL_LIB_U256: u256 = 0x3333333333333333333333333333333333333333333333333333333333333333u256;
pub const LOCAL_LIB_LIB_STRUCT: LocalLibStruct = LocalLibStruct {
    x: 335555,
    y: 0x3333333333333333333333333333333333444444444444444444444444444444u256,
};

#[inline(never)]
pub fn poke<T>(_x: T) { }
