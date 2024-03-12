// Out of the box composability supported by `std` is achieved by implementing
// three traits:
//  - `ScalarStorage<TValue>`
//  - `IndexableStorage<TValue>`
//  - `MappableStorage<TValue>`

// Q: Are these traits breaking the encapsulation of the `Storage`?
//    They provide public information at which slot, e.g., a `StorageVec` element
//    is stored.
//    An alternative implementation can be provided that recieves
//    the element to be stored, that can do checking.
//    But that checking is also limited only to the element and its position.
//    The overall state of the `Storage` is not known.


// Q: Same name for `xzy_storage_key` function in all traits? E.g. `value_storage_key`?
pub trait ScalarStorage<TValue>: Storage {
    fn scalar_storage_key(self_key: StorageKey) -> StorageKey;
}

pub trait IndexableStorage<TValue>: Storage {
    fn element_storage_key(&self_key, element_index: u64) -> StorageKey;
}

pub trait MappableStorage<TKey, TValue>: Storage {
    fn value_storage_key(&self_key, value_index: TKey) -> StorageKey;
}

// `std` `Storage` implementations will implement these traits.

impl<TValue> ScalarStorage<TValue> for StorageBox<TValue> {
    const fn scalar_storage_key(self_key: StorageKey) -> StorageKey {
        self_key
    }
}

impl<TValue> IndexableStorage<TValue> for StorageVec<TValue> {
    /* ... */
    const fn element_storage_key(self_key: StorageKey, element_index: u64) -> StorageKey {
        self_key.
            .offset_by(1)
            .offset_by_type::<V>(index)
    }
}

/* Similar for the `StorageMap`. */

// These traits can then be used to provide generic methods for building composable
// storage types.

// E.g. with this method we support `StorageVec<StorageVec<T>>`, `MyStorageVec<MyStorageVec<T>>`, etc.
impl<TStorage, TElement> StorageVec<TStorage> where TStorage: IndexableStorage<TElement> {
    const fn init(&self_key, elements: [[TElement]]) -> [StorageConfig<StorageVec<TStorage>, TElement>] {
        let mut i = 0;
        let result: [StorageConfig<StorageVec<TStorage>, TElement>] = [];
        while i < elements.len() { // Can be recursion, but let's support `while` in `const fn`s :-)
            let indexable_self_key = StorageKey::new(sha256(self_key, i), 0)

            let mut j = 0;
            let indexable_len = elements[i].len();
            while j < indexable_len {
                let element_key = T::element_storage_key(indexable_self_key, j);
                result += [StorageConfig::new(element_key, elements[i][j])];

                j += 1;
            }

            i += 1;
        }

        result
    }
}

/* Similar for the `StorageMap` and the most common combinations of maps and vectors. */