contract;

use std::storage::storage_vec::*;

storage {
    vec: StorageVec<u64> = StorageVec::<u64> { },
}

#[storage(write)]
fn main() {
    storage.vec.clear();
}
