//! This module contains functions for low-level storage access.
//! These functions should be used only when developing a custom
//! [Storage] and should never occur in a contract code.
//! Even for custom [Storage] implementations, unless a performance
//! gain can be reached by manually controlling reading and
//! writing to the storage, the preferable way of interacting
//! with the storage is via [StorageBox] and [EncodedStorageBox].

// TODO-DISCUSS: See the comment on `Serializable` in the `storage_box.sw`.
use core::marker::Serializable;

pub fn write<T>(storage_key: &StorageKey, value: &T)
where T: Serializable
{
    //--
    // Here comes the same implementation as in the current `std::storage::storage_api::write`.
    //--
}

pub fn read<T>(storage_key: &StorageKey) -> Option<T>
    where T: Serializable 
{ 
    //--
    // Here comes the same implementation as in the current `std::storage::storage_api::read`.
    //--
}

pub fn clear<T>(storage_key: &StorageKey) -> bool
    where T: Serializable 
{
    //--
    // Here comes the same implementation as in the current `std::storage::storage_api::clear`.
    //--
}
