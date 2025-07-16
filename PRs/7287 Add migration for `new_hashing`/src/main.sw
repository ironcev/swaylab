contract;

pub mod indirectly_affected_types;
mod std_hash_fns_not_affected;
mod std_hash_fns_directly_affected;
mod std_hash_fns_indirectly_affected;
mod all_expressions;
mod self_made_hash_fns;
mod std_hash_fns_generic_calls;

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

struct CustomStorageType {}
struct CustomGenericStorageType<A, B> {}

type StorageMapAlias = StorageMap<StructA, StorageMap<raw_slice, StorageMap<EnumARec, StorageVec<StorageMap<str[3], u64>>>>>;
type StorageVecAlias = StorageVec<StorageMap<raw_slice, StorageMap<EnumARec, StorageVec<StorageMap<str[3], u64>>>>>;

use std::storage::storage_map::StorageMap as AsStorageMap;

storage {
    not_affected_u8: StorageMap<u8, StorageMap<u8, u64>> = StorageMap {},
    not_affected_b256: StorageMap<b256, StorageMap<b256, u64>> = StorageMap {},
    not_affected_bool: StorageMap<bool, StorageMap<bool, u64>> = StorageMap {},
    not_affected_secp256k1: StorageMap<Secp256k1, StorageMap<Secp256k1, u64>> = StorageMap {},
    not_affected_secp256r1: StorageMap<Secp256r1, StorageMap<Secp256r1, u64>> = StorageMap {},
    not_affected_b512: StorageMap<B512, StorageMap<B512, u64>> = StorageMap {},
    // Not allowed in `storage` because they contain pointers.
    // not_affected_message: StorageMap<Message, u64> = StorageMap {},
    // not_affected_public_key: StorageMap<PublicKey, u64> = StorageMap {},

    directly_affected_raw_slice: StorageMap<raw_slice, u64> = StorageMap {},
    directly_affected_raw_slice_inner: StorageMap<u8, StorageMap<raw_slice, u64>> = StorageMap {},
    directly_affected_raw_slice_in_vec: StorageVec<StorageMap<raw_slice, u64>> = StorageVec {},
    directly_affected_str_array: StorageMap<str[3], u64> = StorageMap {},
    directly_affected_str_array_inner: StorageMap<u8, StorageMap<str[3], u64>> = StorageMap {},
    directly_affected_str_array_in_vec: StorageVec<StorageMap<str[3], u64>> = StorageVec {},
    directly_affected_array: StorageMap<[u64; 3], u64> = StorageMap {},
    directly_affected_array_inner: StorageMap<u8, StorageMap<[u64; 3], u64>> = StorageMap {},
    directly_affected_array_in_vec: StorageVec<StorageMap<[u64; 3], u64>> = StorageVec {},
    // Not allowed in `storage` because they contain pointers.
    // directly_affected_str: StorageMap<str, u64> = StorageMap {},
    // directly_affected_vec: StorageMap<Vec<u8>, u64> = StorageMap {},
    // directly_affected_bytes: StorageMap<Bytes, u64> = StorageMap {},

    indirectly_affected_struct_a: StorageMap<StructA, u64> = StorageMap {},
    indirectly_affected_struct_a_inner: StorageMap<u8, StorageMap<StructA, u64>> = StorageMap {},
    indirectly_affected_struct_a_in_vec: StorageVec<StorageMap<StructA, u64>> = StorageVec {},
    indirectly_affected_struct_a_rec: StorageMap<StructARec, u64> = StorageMap {},
    indirectly_affected_enum_a: StorageMap<EnumA, u64> = StorageMap {},
    indirectly_affected_enum_a_rec: StorageMap<EnumARec, u64> = StorageMap {},
    indirectly_affected_tuple_str_array: StorageMap<(str[3], ), u64> = StorageMap {},
    indirectly_affected_tuple_array: StorageMap<(u8, [u64; 3]), u64> = StorageMap {},
    indirectly_affected_tuple_struct_a: StorageMap<(u8, StructA), u64> = StorageMap {},
    indirectly_affected_tuple_struct_a_rec: StorageMap<(u8, StructARec), u64> = StorageMap {},
    indirectly_affected_tuple_enum_a: StorageMap<(u8, EnumA), u64> = StorageMap {},
    indirectly_affected_tuple_enum_a_rec: StorageMap<(u8, EnumARec), u64> = StorageMap {},
    // Not allowed in `storage` because they contain pointers.
    // indirectly_affected_struct_b: StorageMap<StructB, u64> = StorageMap {},
    // indirectly_affected_struct_c: StorageMap<StructC, u64> = StorageMap {},
    // indirectly_affected_struct_b_rec: StorageMap<StructBRec, u64> = StorageMap {},
    // indirectly_affected_struct_c_rec: StorageMap<StructCRec, u64> = StorageMap {},
    // indirectly_affected_enum_b: StorageMap<EnumB, u64> = StorageMap {},
    // indirectly_affected_enum_c: StorageMap<EnumC, u64> = StorageMap {},
    // indirectly_affected_enum_b_rec: StorageMap<EnumBRec, u64> = StorageMap {},
    // indirectly_affected_enum_c_rec: StorageMap<EnumCRec, u64> = StorageMap {},
    // indirectly_affected_string: StorageMap<String, u64> = StorageMap {},

    nested_affected_storage_maps: StorageMap<StructA, StorageMap<raw_slice, StorageMap<EnumARec, StorageVec<StorageMap<str[3], u64>>>>> = StorageMap {},
    nested_custom_storage_types: CustomGenericStorageType<CustomStorageType, CustomGenericStorageType<CustomGenericStorageType<u8, CustomStorageType>, u8>> = CustomGenericStorageType {},
    all_in_one: StorageMap<StructA, CustomGenericStorageType<StorageMap<raw_slice, StorageMap<EnumARec, StorageVec<StorageMap<str[3], u64>>>>, CustomStorageType>> = StorageMap {},

    not_affected {
        not_affected_u8: StorageMap<u8, u64> = StorageMap {},
    },

    directly_affected {
        directly_affected_raw_slice: StorageMap<raw_slice, u64> = StorageMap {},
    },

    indirectly_affected {
        indirectly_affected_struct_a: StorageMap<StructA, u64> = StorageMap {},
    },

    nested {
        nested {
            nested {
                not_affected_u8: StorageMap<u8, u64> = StorageMap {},
                directly_affected_raw_slice: StorageMap<raw_slice, u64> = StorageMap {},
                indirectly_affected_struct_a: StorageMap<StructA, u64> = StorageMap {},
            }
        }
    },

    #[cfg(experimental_new_encoding = false)]
    no_type_info_storage_map: StorageMap<u64, u64> = StorageMap {},
    #[cfg(experimental_new_encoding = false)]
    no_type_info_storage_vec: StorageVec<u64> = StorageVec {},
    #[cfg(experimental_new_encoding = false)]
    no_type_info_struct: CustomStorageType = CustomStorageType {},
    #[cfg(experimental_new_encoding = false)]
    no_type_info_alias: StorageMapAlias = StorageMapAlias {},
    #[cfg(experimental_new_encoding = false)]
    no_type_info_u8: u8 = 0,
    #[cfg(experimental_new_encoding = false)]
    no_type_info_array: [u8; 3] = [0, 0, 0],

    storage_map_alias: StorageMapAlias = StorageMapAlias {},
    storage_vec_alias: StorageVecAlias = StorageVecAlias {},

    storage_map_as: AsStorageMap<StructA, StorageMap<raw_slice, AsStorageMap<EnumARec, StorageVec<AsStorageMap<str[3], u64>>>>> = AsStorageMap {},
}

impl MainAbi for Contract {
    fn main() {
        let _ = std_hash_fns_not_affected::play();
        let _ = std_hash_fns_directly_affected::play();
        let _ = std_hash_fns_indirectly_affected::play();
        let _ = all_expressions::play();
        let _ = self_made_hash_fns::play();
        let _ = std_hash_fns_generic_calls::play();
    }
}
