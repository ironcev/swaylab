contract;

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