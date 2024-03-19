contract;

struct MyTwoVecStorage<A, B> {
    a: StorageVec<A>,
    b: StorageVec<B>,
}

storage {
    vec_01: StorageVec<u64> := StorageVec::arithmetic(0, 1, 100),
    vec_02: StorageVec<u64> := StorageVec::init([1, 2, 3]),

    vec_of_vec_01: StorageVec<StorageVec<u64>> := StorageVec::init([
        StorageVec::init([1]),
        StorageVec::init([1, 2]),
        StorageVec::init([1, 2, 3]),
        StorageVec::init([1, 2, 3, 4]),
    ]),

    map_01: StorageMap<str[3], MyStorageVec<u64>> := StorageMap::init([
        ("abc", MyStorageVec::init([1]))
        ("def", MyStorageVec::init([1, 2]))
        ("ghi", MyStorageVec::init([1, 2, 3]))
    ]),

    map_02: StorageMap<str[3], MyStorageMap<u64, StorageVec<u64>>> := StorageMap::init([
        (
            "abc",
            MyStorageMap::init([
                (11, StorageVec::init([1])),
                (12, StorageVec::init([1, 2])),
                (13, StorageVec::init([1, 2, 3])),
            ])
        ),
        (
            "def",
            MyStorageMap::init([
                (21, StorageVec::init([11])),
                (22, StorageVec::init([11, 22])),
                (23, StorageVec::init([11, 22, 33])),
            ])
        ),
    ]),

    my_storage_01: MyTwoVecStorage<u64, str[3]> := MyTwoVecStorage::init(
        [1, 2, 3],
        ["abc", "def"]
    ),

    my_storage_02: MyTwoVecStorage<StorageVec<StorageVec<u64>>, StorageMap<str[3], u64> := MyTwoVecStorage::init(
        [
            StorageVec::init([
                StorageVec::init([1]),
                StorageVec::init([1, 2]),
                StorageVec::init([1, 2, 3]),
                StorageVec::init([1, 2, 3, 4]),
            ]),
            ,
            StorageVec::init([
                StorageVec::init([11]),
                StorageVec::init([11, 22]),
                StorageVec::init([11, 22, 33]),
                StorageVec::init([11, 22, 33, 44]),
            ]),
        ],
        [
            StorageMap::init([
                ("abc", 1),
                ("def", 2),
                ("ghi", 3),
            ]),
            StorageMap::init([
                ("ABC", 11),
                ("DEF", 22),
                ("GHI", 33),
            ]),
        ]
    ),
}

fn main() {
    /* Get `slot` and `offset`. */
    let vec_storage_key = StorageKey::new(slot, offset);

    // We still have an issue of providing the `self_key` twice.
    // This is the issue of the `StorageConfig` type and need to be solved separately from the closure approach.
    let vec = StorageVec::<u64>::arithmetic(0, 1, 100)(vec_storage_key).to_storage(vec_storage_key);
}