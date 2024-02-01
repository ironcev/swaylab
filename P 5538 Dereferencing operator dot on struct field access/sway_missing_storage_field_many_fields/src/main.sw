contract;

storage {
    x: u8 = 0,
    y: u8 = 0,
    z: u8 = 0,
    q: u8 = 0,
    a: u8 = 0,
    b: u8 = 0,
    c: u8 = 0,
}

abi ReadStorage {
    #[storage(read)]
    fn read_storage();
}

impl ReadStorage for Contract {
    #[storage(read)]
    fn read_storage() {
        let _ = storage.abc.read();
    }
}
