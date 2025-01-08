// IDEA: Use specific subtraits of `Storage` to get the `init` constructor generated.
// CONS: Trait function should be used only by the compiler.
// ALT:  Use just a "special function" without a trait?
// Q:    Can a type implement different `XYZStorage`? We cannot have more then one `init` function.

// Q: Is it same as just `Storage`? 
//    Having it gives flexibility not to store exactly at `id`.
trait ScalarStorage: Storage {
    fn scalar_storage_key(self_key: StorageKey) -> StorageKey;
}

impl<V> ScalarStorage for StorageBox<V> {
    /* ... */
    const fn scalar_storage_key(self_key: StorageKey) -> StorageKey {
        self_key
    }
}

impl<T> T where T: ScalarStorage {
    const fn init() {
        /* Compiler generated. */
    }
}

// ALT: VecStorage? ArrayStorage?
trait IndexableStorage: Storage {
    fn element_storage_key(self_key: StorageKey, element_index: u64) -> StorageKey;
}

impl<V> IndexableStorage for StorageVec<V> {
    /* ... */
    const fn element_storage_key(self_key: StorageKey, element_index: u64) -> StorageKey {
        self_key.
            .offset_by(1)
            .offset_by_type::<V>(index)
    }
}

/* Ibid for maps. MappableStorage? */