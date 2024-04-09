// Provides the information to the compiler at which `storage_key` to store the `value`.
// `TStorage` is just a marker trait to gain additional type safety and catch mistakes like these:
//   x: StorageVec<u64> := SomeOtherStorageVec<u64>::init(self_key, [1, 2, 3]),
pub struct StorageConfig<TStorage, TValue> where TStorage: Storage {
    storage_key: StorageKey,
    value: TValue,
}

// Every const expression that returns `StorageConfigResult` can be used on the RHS of the "configures with" operator (:=).
// `StorageConfigResult` we define recursively as:
//   StorageConfigResult = StorageConfig<...> | [StorageConfigResult] | [StorageConfigResult; n] | (StorageConfigResult, ..)
// In practice, there will be configuration const functions that will return a single StorageConfig<...> or a slice [StorageConfig<...>].
// Supporting tuples means supporting configuration of storages that store non-homogenous values (in terms of their types).

// The compiler will check that all the `StorageConfig` types used in the `StorageConfigResult` are the same as the
// LHS `Storage` type.

storage {
    // A few academical examples to demonstrate the completeness of the definition.
    // In practice `StorageConfig` will never be used directly in the storage.
    a: StorageBox<bool> := StorageConfig<StorageBox<bool>, bool>::new(self_key, true),
    b: StorageBox<u8> := if SOME_CONST > 0 {
        StorageConfig<StorageBox<bool>, u8>::new(self_key, 11)
    } else {
        StorageConfig<StorageBox<bool>, u8>::new(self_key, 22)
    },
    c: StorageBox<u8> := [
        StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 1), 11),
        StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 2), 22),
        StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 3), 33),
    ],
    d: StorageBox<u8> := [
        (
            StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 1_1), 11),
            StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 1_2), 22),
        ),
        (
            StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 2_1), 33),
            StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 2_2), 44),
        ),
    ],
}

impl<TStorage, TValue> StorageConfig<TStorage, TValue> {
    const fn new(storage_key: StorageKey, value: TValue) -> Self {
        Self {
            storage_key,
            value,
        }
    }

    // Convenient for reusing exisitng storage config functions when developing
    // a custom storage that is composed of existing storage types that have
    // config functions.
    // We can use `From`/`Into` for this as well, but the idea of casting is
    // to have no-op implementation.
    const fn cast<TOtherStorage>(&self) -> StorageConfig<TOtherStorage, TValue> {
        // Copying here but should be no-op!
        StorageConfig<TOtherStorage, TValue> {
            storage_key: self.storage_key,
            value: self.value,
        }
    }
}

impl<TStorage, TValue> [StorageConfig<TStorage, TValue>] {
    // Convenient for reusing exisitng storage config functions when developing
    // a custom storage that is composed of existing storage types that have
    // config functions.
    // We can use `From`/`Into` for this as well, but the idea of casting is
    // to have no-op implementation.
    const fn cast<TOtherStorage>(&self) -> [StorageConfig<TOtherStorage, TValue>] {
        // Copying here but should be no-op!
        // This is just to show that it can be developed using pure Sway.
        let mut i = 0;
        let result: [StorageConfig<TOtherStorage, TValue>] = [];
        while i < self.len() { // Can be recursion, but let's support `while` in `const fn`s :-)
            result += [
                StorageConfig<TOtherStorage, TValue> {
                    storage_key: self.storage_key,
                    value: self.value,
                }
            ];

            i += 1;
        }

        result
    }
}

// To convert `StorageConfig`s into `Storage` the `ToStorage` trait is used and
// `std` provides standard generic implementations.

pub trait ToStorage<TStorage> where TStorage: Storage {
    fn to_storage(&self, storage_self_key: StorageKey) -> TStorage;
}

impl<TStorage> ToStorage<TStorage> for StorageConfig<TStorage, TValue> {
    fn to_storage(&self, storage_self_key: StorageKey) -> TStorage {
        // We assume here of course that the `StorageConfig` got created
        // with the same `self_key` as the one provided for the creation
        // of the `TStorage`.
        // As mentioned in the usage example, this is error-prone.
        self.storage_key.write::<TValue>(self.value);

        TStorage::new(storage_self_key)
    }
}

impl<TStorage> ToStorage<TStorage> for [StorageConfig<TStorage, TValue>] {
    fn to_storage(&self, storage_self_key: StorageKey) -> TStorage {
        // We assume here of course that the `StorageConfig` got created
        // with the same `self_key` as the one provided for the creation
        // of the `TStorage`.
        // As mentioned in the usage example, this is error-prone.

        let mut i = 0;
        while i < self.len() {
            self[i].storage_key.write::<TValue>(self.value);
        }

        TStorage::new(storage_self_key)
    }
}

// Implementing config functions for custom types.

struct MyTwoVecStorage<A, B> {
    a: StorageVec<A>,
    b: StorageVec<B>,
}

impl<A, B> MyTwoVecStorage<A, B> {
    const fn init(&self_key, a_elements: [A], b_elements: [B]) -> ([StorageConfig<Self, A>], [StorageConfig<Self, B>]) {
        let a_key = StorageKey::new(sha256((self_key, "a")), 0);
        let b_key = StorageKey::new(sha256((self_key, "b")), 0);
        
        (StorageVec<A>::init(a_elements).cast::<Self>(), StorageVec<B>::init(b_elements).cast::<Self>())
    }
}
