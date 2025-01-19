contract;

// use sway_libs::upgradability::PROXY_OWNER_STORAGE;
// use standards::src14::SRC14_TARGET_STORAGE;

// use sway_libs::upgradability::*;
// use standards::src14::*;
const PROXY_OWNER_STORAGE: b256 = b256::zero();
const SRC14_TARGET_STORAGE: b256 = b256::zero();

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

    // --- SRC-14 keys mixed with arbitrary keys.
    a in 0xbb79927b15d9259ea316f2ecb2297d6cc8851888a98278c0a2e03e1a091ea754: u64 = 0,
    b in 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20: u64 = 0,
    c in 0x7bb458adc1d118713319a5baa00a2d049dd64d2916477d2688d76970c898cd55: u64 = 0,
    d in PROXY_OWNER_STORAGE: u64 = 0,
    // e in sway_libs::upgradability::PROXY_OWNER_STORAGE: u64 = 0,
    f in SRC14_TARGET_STORAGE: u64 = 0,
    // g in standards::src14::SRC14_TARGET_STORAGE: u64 = 0,
    // ---
}

fn test_u256_suffix() {
    let _ = 0xaa_u256;
    let _ = 0xaau256;
    let _: u256 = 0xaa;
    let _: u256 = 123;
    // let _ = 123_u256;
    //             ^^^^ invalid u256. Only hex literals are supported
}

abi Abi { }

impl Abi for Contract {
}
