// Provides the `self_key` of the whole `Storage` that gets configured,
// along with the configuration of all the elements.
// Unfortunately, we cannot constraint `TStorageElements` via type-system
// to be of `StorageElementConfig<TStorage, ..>` :-(
pub struct StorageConfig<TStorageElements, TStorage>
    where TStorage: Storage
{
    self_key: StorageKey,
    elements: TStorageElements,
}

// Provides the information to the compiler at which `storage_key` to store the `value`.
// `TStorage` is just a marker trait to gain additional type safety and catch mistakes like these:
//   x: StorageVec<u64> := SomeOtherStorageVec<u64>::init(self_key, [1, 2, 3]),
pub struct StorageElementConfig<TStorage, TValue> where TStorage: Storage {
    storage_key: StorageKey,
    value: TValue,
}

// Every const expression that returns `StorageConfigResult` can be used as `TStorageElements` type.
// `StorageConfigResult` we define recursively as:
//   StorageConfigResult = StorageConfig<...> | [StorageConfigResult] | [StorageConfigResult; n] | (StorageConfigResult, ..)
// In practice, there will be configuration const functions that will return a single StorageElementConfig<...> or a slice [StorageElementConfig<...>].
// Supporting tuples means supporting configuration of storages that store non-homogenous values (in terms of their types).

// The compiler will check that all the `StorageElementConfig` types used in the `TStorageElements` are the same as the
// LHS `Storage` type.

storage {
    // A few academical examples to demonstrate the completeness of the definition.
    // In practice `StorageConfig` will never be used directly in the storage.
    a: StorageBox<bool> := StorageConfig<StorageElementConfig<StorageBox<bool>, bool>>::new(self_key,
        StorageElementConfig::new(self_key, true)
    ),
    b: StorageBox<u8> := if SOME_CONST > 0 {
        StorageConfig<StorageElementConfig<StorageBox<bool>, u8>>::new(self_key,
            StorageElementConfig<StorageBox<bool>, u8>::new(self_key, 11)
        )
    } else {
        StorageConfig<StorageElementConfig<StorageBox<bool>, u8>>::new(self_key,
            StorageConfig<StorageBox<bool>, u8>::new(self_key, 22)
        )
    },
    c: StorageBox<u8> := StorageConfig {
        self_key, // Interesting. The contextual keyword is the same as the field name ;-)
        elements: [
            StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 1), 11),
            StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 2), 22),
            StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 3), 33),
        ],
    },
    d: StorageBox<u8> := StorageConfig {
        self_key, // Interesting. The contextual keyword is the same as the field name ;-)
        elements: [
            (
                StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 1_1), 11),
                StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 1_2), 22),
            ),
            (
                StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 2_1), 33),
                StorageConfig<StorageBox<u8>, u8>::new(sha256(self_key, 2_2), 44),
            ),
        ],
    },
}

impl<TStorage, TValue> StorageElementConfig<TStorage, TValue> {
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
    const fn cast<TOtherStorage>(&self) -> StorageElementConfig<TOtherStorage, TValue> {
        // Copying here but should be no-op!
        StorageConfig<TOtherStorage, TValue> {
            storage_key: self.storage_key,
            value: self.value,
        }
    }
}

impl<TStorage, TValue> [StorageElementConfig<TStorage, TValue>] {
    // Convenient for reusing exisitng storage config functions when developing
    // a custom storage that is composed of existing storage types that have
    // config functions.
    // We can use `From`/`Into` for this as well, but the idea of casting is
    // to have no-op implementation.
    const fn cast<TOtherStorage>(&self) -> [StorageElementConfig<TOtherStorage, TValue>] {
        // Copying here but should be no-op!
        // This is just to show that it can be developed using pure Sway.
        let mut i = 0;
        let result: [StorageElementConfig<TOtherStorage, TValue>] = [];
        while i < self.len() { // Can be recursion, but let's support `while` in `const fn`s :-)
            result += [
                StorageElementConfig<TOtherStorage, TValue> {
                    storage_key: self.storage_key,
                    value: self.value,
                }
            ];

            i += 1;
        }

        result
    }
}

// To convert `StorageConfig`s into `Storage` the common `From` trait is used and
// `std` provides standard generic implementations.

impl<TStorage, TValue> From<StorageConfig<StorageElementConfig<TStorage, TValue>, TStorage>> for TStorage
    where TStorage: Storage
{
    fn from(storage_config: StorageConfig<StorageElementConfig<TStorage, TValue>, TStorage>) -> Self {
        storage_config.elements.storage_key.write::<TValue>(storage_config.elements.value);

        TStorage::new(storage_config.self_key)
    }
}

impl<TStorage, TValue> From<StorageConfig<[StorageElementConfig<TStorage, TValue>], TStorage>> for TStorage
    where TStorage: Storage
{
    fn from(storage_config: StorageConfig<[StorageElementConfig<TStorage, TValue>], TStorage>) -> Self {
        let mut i = 0;
        while i < storage_config.elements.len() {
            let element = &storage_config.elements[i];
            element.storage_key.write::<TValue>(element.value);
        }

        TStorage::new(storage_config.self_key)
    }
}

// Implementing config functions for custom types.

struct MyTwoVecStorage<A, B> {
    a: StorageVec<A>,
    b: StorageVec<B>,
}

impl<A, B> MyTwoVecStorage<A, B> {
    const fn init(&self_key, a_elements: [A], b_elements: [B]) -> StorageConfig<([StorageElementConfig<Self, A>], [StorageElementConfig<Self, B>]), Self> {
        let a_key = StorageKey::new(sha256((self_key, "a")), 0);
        let b_key = StorageKey::new(sha256((self_key, "b")), 0);
        
        StorageConfig {
            self_key,
            elements: (
                StorageVec<A>::init(a_elements).elements.cast::<Self>(),
                StorageVec<B>::init(b_elements).elements.cast::<Self>()
            ),
        }
    }
}
