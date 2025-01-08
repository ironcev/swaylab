contract;

storage {
    a: StorageMap<str[3], StorageVec<Struct>> := StorageMap<_, _> {
        "abc" => { Struct { x: 1 },  Struct { x: 2 }, Struct { x: 3 } },
        "def" => { Struct { x: 11 },  Struct { x: 22 }, Struct { x: 33 } },
        "ghi" => { Struct { x: 111 },  Struct { x: 111 }, Struct { x: 333 } },
    }

    b: StorageVec<StorageVec<StorageMap<str[3], Struct>> := StorageVec<_> {
        { 
            {
                "abc" => Struct { x: 1 },
                "def" => Struct { x: 2 },
            },
            {
                "abc" => Struct { x: 11 },
                "def" => Struct { x: 22 },
            },
        },
        { 
            {
                "abc" => Struct { x: 101 },
                "def" => Struct { x: 202 },
            },
            {
                "abc" => Struct { x: 1101 },
                "def" => Struct { x: 2202 },
            },
        },
    }
}

storage {
    a: MyStorageMap<str[3], MyStorageVec<Struct>> := MyStorageMap<_, _> {
        "abc" => { Struct { x: 1 },  Struct { x: 2 }, Struct { x: 3 } },
        "def" => { Struct { x: 11 },  Struct { x: 22 }, Struct { x: 33 } },
        "ghi" => { Struct { x: 111 },  Struct { x: 111 }, Struct { x: 333 } },
    }

    b: MyStorageVec<MyStorageVec<MyStorageMap<str[3], Struct>> := MyStorageVec<_> {
        { 
            {
                "abc" => Struct { x: 1 },
                "def" => Struct { x: 2 },
            },
            {
                "abc" => Struct { x: 11 },
                "def" => Struct { x: 22 },
            },
        },
        { 
            {
                "abc" => Struct { x: 101 },
                "def" => Struct { x: 202 },
            },
            {
                "abc" => Struct { x: 1101 },
                "def" => Struct { x: 2202 },
            },
        },
    }
}


/// Maps the `index` to a [StorageKey] at which the element
/// at the position `index` should be stored.
/// 
/// * `self_key`: [StorageKey] - The storage slot at which the collection is stored.
///                              This is the same key as the `id` key passed to the [Storage::new] constructor.
fn map_index(self_key: StorageKey, index: u64) -> StorageKey

/// Maps the `key` to a [StorageKey] at which the value
/// to which `key` maps should be stored.
/// 
/// * `self_key`: [StorageKey] - The storage slot at which the map is stored.
///                              This is the same key as the `id` key passed to the [Storage::new] constructor.
fn map_key<T>(self_key: StorageKey, key: T) -> StorageKey