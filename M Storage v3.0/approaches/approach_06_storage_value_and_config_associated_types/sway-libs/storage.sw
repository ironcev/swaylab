//--
// Unlike the current `StorageKey`, the new one becomes a plain struct that holds
// the `slot` and the `offset`. There will be no storage type impls on it.
//--
pub struct StorageKey {
    slot: b256,
    offset: u64,
}

impl StorageKey {
    pub const fn new(slot: b256, offset: u64) -> Self {
        Self {
            slot,
            offset
        }
    }
}

/// Defines how a concrete [Storage] implementation places
/// its stored values within the storage, relative to the
/// given self key of the storage.
pub enum StorageLayout {
    /// The values are scattered within the storage and
    /// can be on arbitrary storage slots, unrelated to
    /// the self key.
    Scattered: (),
    /// The values are stored starting from the self key
    /// in a continuous sequence of consequtive storage
    /// slots. The size that the stored value occupies is
    /// not know and can vary.
    Continuous: (),
    /// The values are stored starting from the self key
    /// in a continuous sequence of consequtive storage
    /// slots. The size that the stored value occupies is
    /// known and fixed.
    ContinuousOfKnownSize: u64,
}

//--
// Functions and methods marked with `internal` are used only by Storage
// implementors and by the compiler.
//
// TODO-DISCUSS: Should we introduce a language feature here and not rely on a naming convention hack?
//               E.g., a language feature for something like `pub(impl) fn`.
//               The naming convention solution is convenient and simple, but still bloats the list
//               of methods/functions availabe in a scope.
//--
pub trait Storage {
    /// The type of the value that can be stored in this storage.
    type Value;
    /// The type of the configuration used to configure this storage.
    //--
    // TODO-IG: Strictily define and list possible combinations. Compiler will check and emit error here.
    //          `TStoredValue` cannot be a `Storage`.
    //--
    type Config;

    /// Creates a new [Storage] that is not initialized.
    ///
    /// To create a new initialized [Storage], use the [Storage::init] constructor.
    //--
    //  Compiler will call this function in the storage element access.
    //  E.g. in `storage.x` to create `x`.
    //--
    fn new(self_key: &StorageKey) -> Self;

    /// Creates a configuration information for configuring this [Storage].
    /// The [Storage] will be located at the `self_key` and has to store `values`.
    ///
    /// This function should be used only when developing a custom
    /// [Storage] and should never occur in contract code.
    //--
    //  Compiler will call this function when generating storage slots.
    //  It will pass the `self_key` that it has generated for the storage element
    //  and the `value` will be the the const evald configuration value,
    //  the RHS of the `:=` operator.
    //--
    const fn internal_get_config(self_key: &StorageKey, value: &Self::Value) -> Self::Config;

    /// The [StorageLayout] of this [Storage].
    ///
    /// This function should be used only when developing a custom
    /// [Storage] and should never occur in contract code.
    const fn internal_layout() -> StorageLayout;

    /// The self key of this [Storage].
    ///
    /// This function is mainly used for obtaining a [StorageRef] to a [Storage].
    const fn self_key(&self) -> StorageKey;

    /// Creates a new [Storage] that is initialized to the `value`.
    /// The created [Storage] is located at the `self_key` and stores the `value`.
    //--
    // TODO-DISCUSS: Should we pass `&Self::Value` here or just `Self::Value`?
    //               This is a general question that is not only related to the storage API.
    //               It will become relevant when we introduce references in the STD.
    //               Avoiding copying data but not having the move semantics. How much can we
    //               optimize? How to avoid heap allocations? Etc.
    //--
    #[storage(read, write)]
    fn init(self_key: &StorageKey, value: &Self::Value) -> Self;
}

/// Provides information to the compiler, during the configuration of the `storage`,
/// at which `storage_key` to store the `value`.
///
/// This type should never be used in contract code.
pub struct StorageConfig<TStoredValue>
{
    storage_key: StorageKey,
    value: TStoredValue,
}

/// A [Storage] that supports reading its entire stored value.
pub trait DeepReadStorage: Storage {
    /// Returns the entired value stored in the [Storage],
    /// or `None` if the [Storage] is uninitialized.
    ///
    /// Composable storage types usually offer specialized
    /// methods for accessing parts of the stored value.
    /// Retrieving the entire stored value should be used
    /// only if the entire value is actually needed.
    ///
    /// Not all storage types can retrieve the value
    /// they store. E.g., a [StorageMap] is not aware of
    /// all the elements stored and require access by
    /// key to individual elements.
    ///
    /// Retrieving the entire stored value can require
    /// high amout of storage reads for certain storage
    /// types. Therfore this method must always be
    /// used with care and only if the entire value is
    /// actually needed.
    #[storage(read)]
    fn try_deep_read(&self) -> Option<Self::Value>;
} {
    #[storage(read)]
    fn deep_read(&self) -> Self::Value {
        self.try_deep_read().unwrap()
    }
}