contract;

struct MyTwoVecStorage<A, B> {
    a: StorageVec<A>,
    b: StorageVec<B>,
}

impl<A, B> Storage for MyTwoVecStorage<A, B> {
    const fn new(self_key: &StorageKey) -> Self {
        let a_key = StorageKey::new(sha256((self_key, "a")), 0);
        let b_key = StorageKey::new(sha256((self_key, "b")), 0);

        Self {
            self_key,
            a: StorageVec<A>::new(a_key),
            b: StorageVec<A>::new(b_key),
        }
    }
}

impl<A, B> MyTwoVecStorage<A, B> {
    // The implementation will be given and explained later.
    const fn init(/* ...*/) /* ...*/ {
        /* ...*/
    }
}

storage {
    // `self_key` is const in the storage context. It is provided by the compiler.
    vec_01: StorageVec<MyStruct> := StorageVec::new(self_key),
    // Alternative syntax. No need to write `self_key`. Syntax sugar.
    // Justification: similar to `self`. No need to pass it to a method. It allows method calls. Also syntax sugar.
    // Both can be used.
    vec_02: StorageVec<MyStruct> := StorageVec::new(),

    // Devs can provide their own configuration methods for `Storage` impls.
    // E.g., for specializations.
    vec_03: StorageVec<u64> := StorageVec::range(self_key, 1, 100),
    vec_04: StorageVec<u64> := StorageVec::fib(self_key, 13), // First 13 Fibbonaci numbers.

    // [T].
    vec_05: StorageVec<u64> := StorageVec::init(self_key, [1, 2, 3]),

    // Composability.
    // Arbitrary combination of `Storage`s can be put into storage.
    // Arbitrary recursive nesting in the configuration is possible by using the
    // `StorageKey::FROM_PARENT`.
    // Q: Any better name? To verbose. Can we shorten it somehow? Only `FROM_PARENT` as a global constant?
    vec_of_vec_01: StorageVec<StorageVec<u64>> := StorageVec::init(self_key,
        [
            StorageVec::init(StorageKey::FROM_PARENT, [1]),
            StorageVec::init(StorageKey::FROM_PARENT, [1, 2]),
            StorageVec::init(StorageKey::FROM_PARENT, [1, 2, 3]),
            StorageVec::init(StorageKey::FROM_PARENT, [1, 2, 3, 4]),
        ]
    ),

    vec_of_vec_02: StorageVec<MyStorageVec<(u64, u64)>> := StorageVec::init(self_key,
        [
            MyStorageVec::init(StorageKey::FROM_PARENT, [(0, 1)]),
            MyStorageVec::init(StorageKey::FROM_PARENT, [(1, 1), (1, 2)]),
            MyStorageVec::init(StorageKey::FROM_PARENT, [(2, 1), (2, 2), (2, 2)]),
        ]
    ),

    map_01: StorageMap<str[3], MyStorageVec<u64>> := StorageMap::init(self_key,
        [
            ("abc", MyStorageVec::init(StorageKey::FROM_PARENT, [1])),
            ("def", MyStorageVec::init(StorageKey::FROM_PARENT, [1, 2])),
            ("ghi", MyStorageVec::init(StorageKey::FROM_PARENT, [1, 2, 2])),
        ]
    ),

    map_02: StorageMap<str[3], MyStorageMap<u64, str[1]>> := StorageMap::init(self_key,
        [
            ("abc", MyStorageMap::init(StorageKey::FROM_PARENT,
                [(1, "A"), (1, "B")]
            )),
            ("def", MyStorageMap::init(StorageKey::FROM_PARENT,
                [(2, "A"), (2, "B")]
            )),
            ("ghi", MyStorageMap::init(StorageKey::FROM_PARENT,
                [(3, "A"), (3, "B")]
            )),
        ]
    ),

    // Devs can always provide their own config functions.
    my_storage_01: MyTwoVecStorage<u64, str[3]> := MyTwoVecStorage::init(self_key,
        [1, 2, 3],
        ["abc", "def"]
    ),

    my_storage_02: MyTwoVecStorage<StorageVec<u64>, StorageVec<str[3]>> := MyTwoVecStorage::init(self_key,
        [
            StorageVec::init(StorageKey::FROM_PARENT, [1]),
            StorageVec::init(StorageKey::FROM_PARENT, [1, 2]),
            StorageVec::init(StorageKey::FROM_PARENT, [1, 2, 3]),
        ],
        [
            StorageVec::init(StorageKey::FROM_PARENT, ["abc"]),
            StorageVec::init(StorageKey::FROM_PARENT, ["abc", "def"]),
            StorageVec::init(StorageKey::FROM_PARENT, ["abc", "def", "ghi"]),
        ]
    ),
}

fn main() {
    // All the configuration functions can be used outside of the storage context
    // and turned into instantiation by an `into()` call.
    // Generic `std` implementations of `into()` will be sufficient for all
    // the common cases and plenty of edge-cases.

    /* Get `slot` and `offset`. */
    let vec_storage_key = StorageKey::new(slot, offset);
    let vec = StorageVec::<u64>::range(vec_storage_key, 1, 100).into();
    vec.push(123);

    /* Get `slot` and `offset`. */
    let vec = StorageVec::<u64>::fib(vec_storage_key, 5).into();
    vec.push(123);

    /* ... */
    let my_storage_key = StorageKey::new(slot, offset);
    let my_storage = MyTwoVecStorage::<u64, str[3]>::init(my_storage_key,
        [1, 2, 3],
        ["abc", "def"]
    )
    .into();

    my_storage.a.push(4);
    my_storage.b.push("ghi");

    // `StorageKey::FROM_PARENT` can also be used outside of the storage declaration.
    let my_storage = MyTwoVecStorage::<StorageVec<u64>, StorageVec<str[3]>>::init(self_key,
        [
            StorageVec::init(StorageKey::FROM_PARENT, [1]),
            StorageVec::init(StorageKey::FROM_PARENT, [1, 2]),
            StorageVec::init(StorageKey::FROM_PARENT, [1, 2, 3]),
        ],
        [
            StorageVec::init(StorageKey::FROM_PARENT, ["abc"]),
            StorageVec::init(StorageKey::FROM_PARENT, ["abc", "def"]),
            StorageVec::init(StorageKey::FROM_PARENT, ["abc", "def", "ghi"]),
        ]
    )
    .into(),
}