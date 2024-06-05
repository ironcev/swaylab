// TODO-DISCUSSION: How to call the marker trait that marks the types that are, in Rust terms, Sized, and
//                  do not contain pointers or references?
//                  We want to storage-box only the types that can be safely memcopyed.
//                  Note that this is not the same as `Copy` because `Copy` trait can be manually implemented.
pub struct StorageBox<T> where T: std::marker::Serializable {
    self_key: StorageKey,
}

// TODO-IG: Shell we impl !Storage EncodedStorageBox<T> where T: Serializable. Or should this only be a warning?

//--
// A `StorageBox` cannot contain other `Storage`s.
// `StorageBox` is the atomic storage type. It is the leaf
// of any hierarchy of composed storages. Thinking of an arbitrary
// storage type as a recursive hierarchy of contained storage types,
// `StorageBox` is what stops the recursion. It cannot be broken
// into smaller `Storage` types.
//
// To convey that in the Sway language the proposal is to use "negative impls".
// See: https://doc.rust-lang.org/beta/unstable-book/language-features/negative-impls.html
//--
impl<T> !Storage for StorageBox<T> where T: Storage { }

impl<T> Storage for StorageBox<T> {
    type Value = T;
    type Config = StorageConfig<T>;

    fn new(self_key: &StorageKey) -> Self {
        Self {
            self_key: *self_key
        }
    }

    const fn internal_get_config(self_key: &StorageKey, value: &T) -> StorageConfig<T> {
        StorageConfig {
            self_key: *self_key,
            value: *value,
        }
    }

    const fn internal_layout() -> StorageLayout {
        StorageLayout::ContinuousOfKnownSize(__size_of::<T>())
    }

    const fn self_key(&self) -> StorageKey {
        self.self_key
    }

    #[storage(read, write)]
    fn init(self_key: &StorageKey, value: &T) -> Self {
        storage::internal::write(self_key, value);
        new(self_key)
    }
}

impl StorageBox<T> {
    /// Reverts if the [StorageBox] is uninitialized.
    #[storage(read)]
    fn read(&self) -> T {
        storage::internal::read::<T>(self.self_key).unwrap()
    }

    #[storage(read)]
    fn try_read(&self) -> Option<T> {
        storage::internal::read::<T>(self.self_key)
    }

    #[storage(read, write)]
    fn write(&mut self, value: &T) {
        storage::internal::write(self.self_key, value);
    }
}

impl<T> DeepReadStorage for StorageBox<T> {
    #[storage(read)]
    fn try_deep_read(&self) -> Option<T> {
        self.try_read()
    }
}