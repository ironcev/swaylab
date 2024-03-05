contract;

storage {
    scalar: StorageBox<u64> := StorageBox::init(101),
    vec: StorageVec<u64> := StorageVec::init([11, 22, 33]),
    map: StorageMap<str[3], u64> := StorageMap::init([
        ("abc", 111),
        ("def", 222),
        ("ghi", 333),
    ]),
    // Actually no need for `StorageBox` here, but just for completeness.
    comobo: StorageBox<StorageVec<StorageMap<str[3], u64>>> := StorageBox::init(
        StorageVec::init([
            StorageMap::init([
                ("abc", 111),
                ("def", 222),
                ("ghi", 333),
            ]),
            StorageMap::init([
                ("abc", 111),
                ("def", 222),
                ("ghi", 333),
            ]),
    ])
}

fn main() {
}