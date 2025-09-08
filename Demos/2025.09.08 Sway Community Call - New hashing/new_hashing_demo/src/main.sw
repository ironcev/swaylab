contract;

pub mod indirectly_affected_types;
mod std_hash_fns_directly_affected;
mod std_hash_fns_indirectly_affected;

use std::storage::storage_map::StorageMap;
use std::storage::storage_vec::StorageVec;

use std::b512::*;
use std::bytes::*;
use std::crypto::secp256k1::*;
use std::crypto::secp256r1::*;
use std::crypto::message::*;
use std::crypto::public_key::*;

use ::indirectly_affected_types::*;

abi MainAbi {
    fn main();
}

storage {
    directly_affected_str_array: StorageMap<str[3], u64> = StorageMap {},
    directly_affected_str_array_inner: StorageMap<u8, StorageMap<str[3], u64>> = StorageMap {},

    indirectly_affected_struct_a: StorageMap<StructA, u64> = StorageMap {},
    indirectly_affected_struct_a_inner: StorageMap<u8, StorageMap<StructA, u64>> = StorageMap {},
}

impl MainAbi for Contract {
    fn main() {
        let _ = std_hash_fns_directly_affected::play();
        let _ = std_hash_fns_indirectly_affected::play();
    }
}
