// Out of the box composability supported by `std` is achieved by implementing
// the `ComposableStorage` trait.

pub trait ComposableStorage<TStorageElements>: Storage {
    fn replace_self_key(new_self_key: StorageKey, elements: &mut StorageConfig<TStorageElements, Self>);
}

// `std` `Storage` implementations will implement this trait.

impl<TValue> ComposableStorage<StorageElementConfig<StorageBox<TValue>, TValue>> for StorageBox<TValue> {
    fn replace_self_key(new_self_key: StorageKey, storage_config: &mut StorageConfig<StorageElementConfig<StorageBox<TValue>, TValue>) {
        storage_config.self_key = new_self_key;
        storage_config.elements.storage_key = new_self_key;
    }
}

impl<TValue> ComposableStorage<[StorageElementConfig<StorageVec<TValue>, TValue>]> for StorageVec<TValue> {
    /* ... */
    fn replace_self_key(new_self_key: StorageKey, storage_config: &mut StorageConfig<[StorageElementConfig<StorageVec<TValue>, TValue>]>) {
        storage_config.self_key = new_self_key;

        let mut i = 0;
        while i < storage_config.elements.len() {
            let new_element_key = new_self_key.
                .offset_by(1)
                .offset_by_type::<TValue>(i);

            storage_config.elements[i].storage_key = new_element_key;
        }
    }
}
