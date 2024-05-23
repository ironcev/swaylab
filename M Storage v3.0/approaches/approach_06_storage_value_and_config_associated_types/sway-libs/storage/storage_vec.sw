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

    fn internal_create(self_key: &StorageKey) -> Self {
        Self {
            self_key: *self_key
        }
    }

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

    fn new(self_key: &StorageKey, elements: &[T::Value]) -> Self {
        // Store the length at the `self_key`.
        storage::internal::write(self_key, elements.len());

        let mut i = 0;
        while i < elements.len() {
            let element_self_key = Self::get_element_self_key(self_key, i);
            T::new(element_self_key, &elements[i]);

            i += 1;
        }

        internal_create(self_key)
    }
}

impl<T> StorageVec<T> where T: Storage {
    pub fn len(&self) -> u64 {
        //--
        // Note that we always expect value. API ensures storage is properly initialized.
        //--
        storage::internal::read::<u64>(self.self_key).unwrap()
    }

    pub fn push(&mut self, value: &T::Value) {
        let len = self.len();

        // Store the value.
        let element_self_key = Self::get_element_self_key(self.self_key, len);
        T::new(element_self_key, value);

        // Store the new length.
        storage::internal::write(self.self_key, len + 1);
    }

    /// Removes the last element of the [StorageVec] and returns true if there was a removal,
    /// or false if the vector was empty.
    pub fn pop(&mut self) -> bool {
        let len = self.len();

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

    /// Removes the last element of the [StorageVec] and returns its value if there was a removal,
    /// or `None` if the vector was empty.
    ///
    /// This method can result in multiple storage reads and must,
    /// therefore, be used with caution and only if the popped content
    /// is actually needed.
    pub fn pop_and_get_value(&mut self) -> Option<T::Value>
        where T: StoredValue
    {
        let len = self.len();

        if len <= 0 {
            return None;
        }

        let element_self_key = Self::get_element_self_key(self.self_key, len - 1);
        let val = T::internal_create(element_self_key).value();

        // TODO-DISCUSS: See the above discussion in `pop` about clearing the spots.

        storage::internal::write(self.self_key, len - 1);

        Some(val)
    }

    /// Gets the [Storage] stored at the `element_index`, or `None` if index is out of bounds.
    pub fn get(&self, element_index) -> Option<T> {
        if self.len() <= index {
            return None;
        }

        let element_self_key = Self::get_element_self_key(self.self_key, element_index);
        Some(T::internal_create(element_self_key))
    }
}

impl<T> StoredValue for StorageVec<T> where T: Storage + StoredValue {
    /// Returns the complete content stored within the [StorageVec].
    ///
    /// This method can result in multiple storage reads and must,
    /// therefore, be used with caution and only if the whole content
    /// is actually needed.
    fn value(&self) -> Self::Value {
        let len = self.len();

        let result: Self::Value = [];
        let mut i = 0;
        while i < len {
            let element_self_key = Self::get_element_self_key(self.self_key, i);
            result += T::internal_create(element_self_key).value();

            i += 1;
        }

        result
    }
}