contract;

storage {
    vec_01: StorageVec<u64> := StorageVec { }, // ERROR: We have `id` field.
    vec_02: StorageVec<u64> := StorageVec::new(), // SPECIAL: `id` passed automagically?
    vec_02: StorageVec<u64> := StorageVec::new(self_key), // SPECIAL: `id` passed automagically?
    vec_02: StorageVec<u64> := StorageVec::new(self), // SPECIAL: `id` passed automagically?
    vec_03: StorageVec<u64> := StorageVec::init(self, [1, 2, 3]),
    vec_03: StorageVec<u64> := StorageVec::init(_, [1, 2, 3]),
    vec_03: StorageVec<u64> := StorageVec::init([1, 2, 3]),
}

fn main() {
    /* Get `slot` and `offset`. */
    let vec_storage_key = StorageKey::new(slot, offset);
    let vec = StorageVec::new(vec_storage_key); // Do we want this?
                                                // No examples so far.
                                                // Always `storage.vec` used.
                                                // IMO, yes we want.

    vec.push(123);

    /* ... */

    let vec_storage_key = StorageKey::new(other_slot, other_offset);
    let vec = StorageVec::init(vec_storage_key, [11, 22, 33]);

    vec.push(44);

    /* ... */
}