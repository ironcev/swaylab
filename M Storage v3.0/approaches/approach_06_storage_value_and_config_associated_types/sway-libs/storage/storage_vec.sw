//--
// We assume here that slices will have const eval implementations for:
//  - `[T] += [T] -> [T]`: slice contatenation.
//  - `[T] += T   -> [T]`: extending a slice with an element.
//--
pub struct StorageVec<T> where T: Storage {
    self_key: StorageKey,
}

impl<T> Storage for StorageVec<T> where T: Storage {
    type Value = [T::Value];
    /// The `Config` is a tuple containing the storage configuration
    /// for the length of the [StorageVec], and the configurations
    /// for the stored elements.
    type Config = (StorageConfig<u64>, [T::Config]);

    fn new(self_key: &StorageKey) -> Self {
        Self {
            self_key: *self_key
        }
    }

    const fn internal_get_config(self_key: &StorageKey, elements: &[T::Value]) -> Self::Config {
        // The length is stored at the `self_key`.
        let length_config = StorageConfig {
            storage_key: self_key,
            value: elements.len(),
        };

        let elements_config: [T::Config] = [];
        let mut i = 0;
        while i < elements.len() {
            let element_self_key = Self::get_element_self_key(self_key, i);
            elements_config += T::internal_get_config(&element_self_key, &elements[i]);

            i += 1;
        }

        (length_config, elements_config)
    }

    const fn internal_layout() -> StorageLayout {
        match T::internal_layout() {
            StorageLayout::Scattered | StorageLayout::Continuous => StorageLayout::Scattered,
            StorageLayout::ContinuousOfKnownSize(_) => StorageLayout::Continuous,
        }
    }

    const fn self_key(&self) -> StorageKey {
        self.self_key
    }

    #[storage(read, write)]
    fn init(self_key: &StorageKey, elements: &[T::Value]) -> Self {
        // Store the length at the `self_key`.
        storage::internal::write(self_key, elements.len());

        let mut i = 0;
        while i < elements.len() {
            let element_self_key = Self::get_element_self_key(self_key, i);
            T::init(element_self_key, &elements[i]);

            i += 1;
        }

        new(self_key)
    }
}

impl<T> StorageVec<T> where T: Storage {
    /// Returns the self key of the element stored at `element_index`.
    /// `self_key` is the self key of the [StorageVec].
    const fn get_element_self_key(self_key: &StorageKey, element_index: u64) -> StorageKey {
        match T::internal_layout() {
            StorageLayout::Scattered | StorageLayout::Continuous => {
                // The elements are stored each in its own slot.
                StorageKey::new(__sha256((*self_key, element_index)), 0);
            }
            StorageLayout::ContinuousOfKnownSize(element_size) => {
                //--
                // The elements are packed and aligned to optimize slot usage and storage access.
                // Here we calculate the element storage key based on the packing and aligning.
                //--
                StorageKey::new(<result of the calculation>);
            }
        }
    }

    /// Reverts if the [StorageVec] is uninitialized.
    #[storage(read)]
    pub fn len(&self) -> u64 {
        self.try_len().unwrap()
    }

    #[storage(read)]
    pub fn try_len(&self) -> Option<u64> {
        storage::internal::read::<u64>(self.self_key)
    }

    #[storage(read, write)]
    pub fn push(&mut self, value: &T::Value) {
        let len = self.try_len().unwrap_or(0);

        // Store the value.
        let element_self_key = Self::get_element_self_key(self.self_key, len);
        T::init(element_self_key, value);

        // Store the new length.
        storage::internal::write(self.self_key, len + 1);
    }

    /// Removes the last element of the [StorageVec] and returns true if there was a removal,
    /// or false if the vector was empty or uninitialized.
    ///
    /// To get the last element before popping it use [StorageVec::last].
    //--
    // TODO-DISCUSSION: Should we revert here if the `StorageVec` is uninitialized?
    //                  And provide the `try_pop` accordingly?
    //                  We should try to come up with good API design guidelines for
    //                  similar cases.
    //--
    // TODO-DISCUSSION: Should we offer a method that pops and returned the popped value?
    //                  This could be achieved with a `pop_deep_read` method defined as:
    //
    //                     pub fn pop_deep_read(&mut self) -> Option<T::Value> where T: DeepReadStorage
    //
    //                  The issue with such a method would be the failing semantic.
    //                  What to do if popping is possible, but the deep read fails?
    //                  We could defined it as reverting in that case and not popping.
    //
    //                  AS in other cases we then need to offer the `try` equivalent.
    //                  E.g., `pop_try_deep_read` with a cumbersome returning type of `Option<Option<T::Value`.
    //                  In that case we could successfuly pop even if the deep read fails.
    //--
    #[storage(read, write)]
    pub fn pop(&mut self) -> bool {
        let len = self.try_len().unwrap_or(0);

        if len <= 0 {
            return false;
        }

        // TODO-DISCUSS: Current API just reduces the size of the vector,
        //               but leaves the slots occupied. Shouldn't the proper
        //               behaviour be to clear the slots? Does keeping them
        //               occupied increases the cost or not?
        //               If we go for clearing, in this architecture it is
        //               simple to add it by just having and `internal_clear`
        //               method on the `Storage` and calling it recursively.
        //               For the purpose of this demo, we will just do what the
        //               current API is doing.

        // Store the new length.
        storage::internal::write(self.self_key, len - 1);
    }

    /// Gets the [Storage] stored at the `element_index`, or `None` if index is out of bounds
    /// or the [StorageVec] is uninitialized.
    //--
    // TODO-DISCUSSION: Similar question like above. Should we revert on uninitialized
    //                  and provide `try_get` accordingly?
    //--
    #[storage(read)]
    pub fn get(&self, element_index) -> Option<T> {
        if self.try_len().unwrap_or(0) <= index {
            return None;
        }

        let element_self_key = Self::get_element_self_key(self.self_key, element_index);
        Some(T::new(element_self_key))
    }

    /* ... other `StorageVec` methods ... */
}

impl<T> DeepReadStorage for StorageVec<T> where T: DeepReadStorage {
    /// Returns the entire content stored within the [StorageVec].
    ///
    /// This method can result in multiple storage reads and must,
    /// therefore, be used with caution and only if the entire content
    /// is actually needed.
    #[storage(read)]
    fn deep_read(&self) -> Self::Value {
        try_deep_read().unwrap()
    }

    #[storage(read)]
    fn try_deep_read(&self) -> Option<Self::Value> {
        let len = match self.try_len() {
            Some(len) => len,
            None => return None,
        };

        let result: Self::Value = [];
        let mut i = 0;
        while i < len {
            let element_self_key = Self::get_element_self_key(self.self_key, i);
            result += T::new(element_self_key).deep_read();

            i += 1;
        }

        Some(result)
    }
}