// --
// Unlike the current `StorageKey`, the new one becomes a plain struct that holds
// the `slot` and the `offset`. There will be no impls on it.
// --
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
// implementors and by the compiler. It might be interesting to have
// a language feature for that something like `pub(impl) fn` or just
// `impl fn` to not realy on a naming convention hack that still bloats
// the list of methods/functions availabe in a scope.
//--
pub trait Storage {
    /// The type of the value that can be stored in this storage.
    type Value;
    /// The type of the configuration used to configure this storage.
    //--
    // TODO-IG: Strictily define and list possible combinations. Compiler will check and emit error here.
    //--
    type Config;

    /// Creates a new [Storage] that is not guaranteed to be initialized.
    ///
    /// This constructor should be used only when developing a custom
    /// [Storage] and should never occur in contract code.
    ///
    /// To create a new [Storage] in a contract code, use the [Storage::new] constructor.
    //--
    //  Compiler will call this function in the storage element access.
    //  E.g. in `storage.x` to create `x`.
    //--
    fn internal_create(self_key: &StorageKey) -> Self;

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

    /// The [StorageLayout] of this [Storage]
    ///
    /// This function should be used only when developing a custom
    /// [Storage] and should never occur in contract code.
    const fn internal_layout() -> StorageLayout;

    /// The self key of this [Storage].
    ///
    /// This function is mainly used for obtaining a [StorageRef] to a [Storage].
    const fn self_key(&self) -> StorageKey;

    /// Creates a new [Storage] that is guaranteed to be initialized to the `value`.
    /// The [Storage] will be located at the `self_key` and will store the `value`.
    //--
    // TODO-DISCUSS: Should we pass `&Self::Value` here or just `Self::Value`?
    //               This is a general question which will be relevant when we
    //               introduce references in the STD. Avoiding copies of data
    //               but not having the move semantics. How much can we
    //               optimize? How to avoid heap allocations? Etc.
    //--
    fn new(self_key: &StorageKey, value: &Self::Value) -> Self;
}

/// Provides information to the compiler, during the configuration of the `storage`,
/// at which `storage_key` to store the `value`.
///
/// This type should never be used in code.
pub struct StorageConfig<TStoredValue>
{
    storage_key: StorageKey,
    value: TStoredValue,
}

pub trait StorageDefault where Self: Storage {
    fn default(self_key: &StorageKey) -> Self;
}

impl StorageDefault for Storage where Self::Value: std::default::Default {
    fn default(self_key: &StorageKey) -> Self {
        Self::new(self_key, Self::Value::default())
    }
}

pub trait StoredValue where Self: Storage {
    /// Returns the value stored in the storage.
    ///
    /// Composable storage types usually offer specialized
    /// methods for accessing parts of the stored value.
    /// Retrieving the whole stored value should be used
    /// only if the whole value is actually needed.
    ///
    /// Not all storage types can retrieve the value
    /// they store. E.g., [StorageMap] is not aware of
    /// all the elements stored and require access by
    /// key to individual elements.
    ///
    /// Retrieving the complete value can require
    /// high amout of storage reads for certain storage
    /// types. Therfore this method must always be
    /// used with care and only it the whole value is
    /// actually needed.
    fn value(&self) -> Self::Value;
}