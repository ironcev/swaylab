contract;

struct MyTwoVecStorage<A, B> {
    id: StorageKey,
    a: StorageVec<A>,
    b: StorageVec<B>,
}

impl<A, B> Storage for MyTwoVecStorage<A, B> {
    fn new(&self_key) -> Self {
        let a_key = StorageKey::new(sha256((self_key, "a")), 0);
        let b_key = StorageKey::new(sha256((self_key, "b")), 0);

        Self {
            id: *self_key,
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
    // Arbitrary recursive nesting in the configuration is not possible without callbacks :-( :-(
    // But:
    //  - devs can always write their own config functions for special combinations.
    //  - plenty of practical cases will work out of the box with the standard `std` support.

    // E.g., `std` functionality that will work for arbitrary `IndexableStorage`.
    // But still it feels like a special-case :-(
    vec_of_vec_01: StorageVec<StorageVec<u64>> := StorageVec::from_indexable(self_key,
        [
            [1],
            [1, 2],
            [1, 2, 3],
            [1, 2, 3, 4],
        ]
    ),

    vec_of_vec_02: StorageVec<MyStorageVec<(u64, u64)>> := StorageVec::from_indexable(self_key,
        [                  // ^^ Note the specific vec-like `MyStorageVec`, an `IndexableStorage`.
            [(0, 1)],
            [(1, 1), (1, 2)],
            [(2, 1), (2, 2), (2, 2)],
        ]
    ),

    // Again, `std` functionality, but with aftertaste :-(
    map_01: StorageMap<str[3], MyStorageVec<u64>> := StorageMap::from_indexable(self_key,
        [
            ("abc", [1]),
            ("def", [1, 2]),
            ("ghi", [1, 2, 3]),
        ]
    ),

    // Again, `std` functionality, but with aftertaste :-(
    map_01: StorageMap<str[3], MyStorageMap<u64, str[1]>> := StorageMap::from_mappable(self_key,
        [
            ("abc", (1, "A")),
            ("def", (2, "B")),
            ("ghi", (3, "C")),
        ]
    ),

    // Devs can always provide their own config functions.
    my_storage_01: MyTwoVecStorage<u64, str[3]> := MyTwoVecStorage::init(self_key,
        [1, 2, 3],
        ["abc", "def"]
    ),
}

fn main() {
    // All the configuration functions can be used outside of the storage context
    // and turned into instantiation by a `to_storage()` call.
    // Generic `std` implementations of `to_storage()` will be sufficient for all
    // the common cases and plenty of edge-cases.

    // Ideally we would simply call `into()` but we need to pass the `self_key` to
    // the coverting method.
    // Q: Can we have a design here where this is not needed and `into()` can be used?
    //    With callbacks this could all look differently.
    //    TODO: Provide alternatives if we had callbacks in the language.
    // CONS: Error-prone design because the different key could be passed by mistake.
    //       This could be cought with static analysis.

    /* Get `slot` and `offset`. */
    let vec_storage_key = StorageKey::new(slot, offset);
    let vec = StorageVec::<u6>::range(vec_storage_key, 1, 100).to_storage(vec_storage_key);
    vec.push(123);

    /* Get `slot` and `offset`. */
    let vec = StorageVec::<u6>::fib(vec_storage_key, 5).to_storage(vec_storage_key);
    vec.push(123);

    /* ... */
    let my_storage_key = StorageKey::new(slot, offset);
    let my_storage = MyTwoVecStorage::<u64, str[3]>::init(my_storage_key,
        [1, 2, 3],
        ["abc", "def"]
    )
    .to_storage(vec_storage_key);

    my_storage.a.push(4);
    my_storage.b.push("ghi");
}