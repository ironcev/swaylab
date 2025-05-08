contract;

storage {
    // --- Old keys for x, y, z.
    x in 0xc979570128d5f52725e9a343a7f4992d8ed386d7c8cfd25f1c646c51c2ac6b4b: u64 = 0,
    x_1 in 0xc979570128d5f52725e9a343a7f4992d8ed386d7c8cfd25f1c646c51c2ac6b4b: u64 = 0,
    x_no_key: u64 = 0,
     namespace_1 {
        y in 0x2f055029200cd7fa6751421635c722fcda6ed2261de0f1e0d19d7f257e760589: u64 = 0,
        y_1 in 0x2f055029200cd7fa6751421635c722fcda6ed2261de0f1e0d19d7f257e760589: u64 = 0,
        y_no_key: u64 = 0,
        namespace_2 {
            z in 0x03d2ee7fb8f3f5e1084e86b02d9d742ede96559e44875c6210c7008e2d184694: u64 = 0,
            z_1 in 0x03d2ee7fb8f3f5e1084e86b02d9d742ede96559e44875c6210c7008e2d184694: u64 = 0,
            z_no_key: u64 = 0,
        }
    },
    // ---

    y in b256::zero(): u64 = 0,

    z: u64 = 0,
}

abi Abi { }

impl Abi for Contract {
}
