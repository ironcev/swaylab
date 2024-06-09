/// Stores a reference to a [Storage] of type `TStorage`.
///
/// To create a [StorageRef] use [Storage::as_ref].
///
/// To create a `null` [StorageRef], use [StorageRef::null].
///
/// Internally, the [StorageRef] is just storing the storage key
/// of the referenced storage entity.
///
/// [StorageRef] requires two storage slots to store a reference.
/// Consider using other, less storage consuming, approaches to "reference"
/// storage entities. E.g., if they are stored in a [StorageVec], consider
/// "referencing" them by storing their indices as "references".
//--
// This type is a type safe wrapper around `StorageKey` that
// ensures we are always referencing and dereferencing a
// proper `TStorage` type.
//--
pub struct StorageRef<TStorage> where TStorage: Storage {
    storage_key: StorageKey
}

//--
// We need a special `StorageKey` that will represent a null reference.
// This cannot be the slot and offset (0, 0) because it is regularly
// used as a default storage slot of choice.
// We could define an arbitrary `StorageKey` here, knowing that there
// will never be a collision with a used key.
// However, this approach seams cleaner and can also be documented.
// Essentially, we assume that the last storage slot is reservered internally.
//--
const NULL_REF_STORAGE_KEY: StorageKey = StorageKey { slot: b256::max(), offset: u64::max() };

impl<TStorage> StorageRef<TStorage> where TStorage: Storage {
    const fn null() -> Self {
        Self {
            storage_key: NULL_REF_STORAGE_KEY,
        }
    }

    const fn is_null(&self) -> bool {
        self.storage_key == NULL_REF_STORAGE_KEY
    }
}

/// A [Storage] that stores a [StorageRef<TStorage>].
pub struct StorageRefBox<TStorage> where TStorage: Storage {
    self_key: StorageKey,
}

impl<T> Storage for StorageRefBox<TStorage> where TStorage: Storage {
    type Value = StorageRef<TStorage>;
    type Config = StorageConfig<StorageRef<TStorage>>;

    const fn new(self_key: &StorageKey) -> Self {
        Self {
            self_key: *self_key
        }
    }

    const fn internal_get_config(self_key: &StorageKey, value: &StorageRef<TStorage>) -> StorageConfig<StorageRef<TStorage>> {
        StorageConfig {
            self_key: *self_key,
            value: *value,
        }
    }

    const fn internal_layout() -> StorageLayout {
        StorageLayout::ContinuousOfKnownSize(__size_of::<StorageRef<TStorage>>())
    }

    const fn self_key(&self) -> StorageKey {
        self.self_key
    }

    #[storage(read, write)]
    fn init(self_key: &StorageKey, value: &T) -> Self {
        storage::internal::write(self_key, value);
        Self::new(self_key)
    }
}

impl<TStorage> StorageRefBox<TStorage> where TStorage: Storage {
    /// Reverts if the [StorageBox] is uninitialized or null.
    #[storage(read)]
    fn deref(&self) -> TStorage {
        self.try_deref().unwrap()
    }

    #[storage(read)]
    fn try_deref(&self) -> Option<TStorage> {
        let storage_ref = storage::internal::read::<StorageRef<TStorage>>(self.self_key);
        match storage_ref {
            Some(storage_ref) => {
                if storage_ref.is_null() {
                    None
                } else {
                    Some(TStorage::new(storage_ref)),
                }
            }
            None => None,
        }
    }

    #[storage(read, write)]
    fn write_ref(&mut self, value: &TStorage) {
        storage::internal::write::<StorageRef<TStorage>>(self.self_key, value.as_ref());
    }

    #[storage(read, write)]
    fn write_null(&mut self) {
        storage::internal::write::<StorageRef<TStorage>>(self.self_key, StorageRef::<TStorage>::null());
    }
}

impl<TStorage> DeepReadStorage for StorageRefBox<TStorage> where TStorage: Storage {
    #[storage(read)]
    fn try_deep_read(&self) -> Option<StorageRef<TStorage>> {
        self.try_read()
    }
}
