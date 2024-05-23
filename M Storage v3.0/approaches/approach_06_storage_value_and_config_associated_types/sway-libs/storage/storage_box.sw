// TODO-DISCUSSION: How to call the marker trait that marks the types that are, in Rust terms, Sized, and
//                  do not contain pointers or references?
//                  We want to box only the types that can be safely memcopyed.
//                  Note that this is not the same as `Copy` because `Copy` trait can be manually implemented.
pub struct StorageBox<T> where T: std::marker::Serializable {
    self_key: StorageKey,
}

// TODO-IG: Shell we impl !Storage EncodedStorageBox<T> where T: Serializable. Or should this only be a warning?

// A `StorageBox` cannot contain other `Storage`s.
// `StorageBox` is the atomic storage type. It is the leaf
// of any hierarchy of composed storages. Thinking of an arbitrary
// storage type as a recursive hierarchy of contained storage types,
// `StorageBox` is what stops the recursion. It cannot be broken
// into smaller `Storage` types.

// To convey that in the Sway language the proposal is to use "negative impls".
// See: https://doc.rust-lang.org/beta/unstable-book/language-features/negative-impls.html
impl<T> !Storage for StorageBox<T> where T: Storage { }

impl<T> Storage for StorageBox<T> {
    type Value = T;
    type Config = StorageConfig<T>;

    fn internal_create(self_key: &StorageKey) -> Self {
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

    fn new(self_key: &StorageKey, value: &T) -> Self {
        storage::internal::write(self_key, value);
        internal_create(self_key)
    }
}

impl StorageBox<T> {
    // --
    // There is no need for `try_read` because if the API is used
    // consistently, the `StorageBox` will always contain a value.
    // If the `internal_create` is used, then also the low-level
    // calls should be used for checking if the data exists.
    // --
    fn read(&self) -> T {
        storage::internal::read::<T>(self.self_key).unwrap()
    }

    fn write(&mut self, value: &T) {
        storage::internal::write(self.self_key, value);
    }
}

impl<T> StoredValue for StorageBox<T> {
    fn value(&self) -> T {
        self.read()
    }
}