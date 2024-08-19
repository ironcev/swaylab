script;

mod local_lib;

use local_lib::*;

use my_lib::*;
use my_lib::lib_mod::*;

fn main() {
    poke(LIB_U64);
    poke(LIB_U64_IMM);
    poke(LIB_U256);
    poke(LIB_LIB_STRUCT);

    poke(LibStruct::SELF_IMPL_LIB_LIB_STRUCT_U64);
    poke(LibStruct::SELF_IMPL_LIB_LIB_STRUCT_U64_IMM);
    poke(LibStruct::SELF_IMPL_LIB_LIB_STRUCT_U256);
    poke(LibStruct::SELF_IMPL_LIB_LIB_STRUCT_LIB_STRUCT);

    poke(LibStruct::TRAIT_IMPL_LIB_LIB_STRUCT_U64);
    poke(LibStruct::TRAIT_IMPL_LIB_LIB_STRUCT_U64_IMM);
    poke(LibStruct::TRAIT_IMPL_LIB_LIB_STRUCT_U256);
    poke(LibStruct::TRAIT_IMPL_LIB_LIB_STRUCT_LIB_STRUCT);

    poke(LIB_MOD_U64);
    poke(LIB_MOD_U64);
    poke(LIB_MOD_U64_IMM);
    poke(LIB_MOD_U256);
    poke(LIB_MOD_LIB_STRUCT);

    poke(LOCAL_LIB_U64);
    poke(LOCAL_LIB_U64_IMM);
    poke(LOCAL_LIB_U256);
    poke(LOCAL_LIB_LIB_STRUCT);

    // TODO: Storage!
}
