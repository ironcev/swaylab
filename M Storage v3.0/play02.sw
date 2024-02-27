storage {
    a: StorageMap<str[3], StorageVec<Struct>> := StorageMap<_, _>::init([
        ("abc", StorageVec::init([Struct { x: 1 }, Struct { x: 2 }, Struct { x: 3 }])),
        ("def", StorageVec::init([Struct { x: 11 }, Struct { x: 22 }, Struct { x: 33 }])),
        ("ghi", StorageVec::init([Struct { x: 111 }, Struct { x: 222 }, Struct { x: 333 }])),
    ]),

    b: StorageVec<StorageVec<StorageMap<str[3], Struct>> := StorageVec<_>::init([
        StorageVec::init([
            StorageMap::init([
                ("abc", Struct { x: 1 }),
                ("def", Struct { x: 2 }),
            ]),
            StorageMap::init([
                ("abc", Struct { x: 11 }),
                ("def", Struct { x: 22 }),
            ]),
        ]),
        StorageVec::init([
            StorageMap::init([
                ("abc", Struct { x: 101 }),
                ("def", Struct { x: 202 }),
            ]),
            StorageMap::init([
                ("abc", Struct { x: 1101 }),
                ("def", Struct { x: 2202 }),
            ]),
        ]),
    ])
}