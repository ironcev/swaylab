contract;

abi Abi {
    #[storage(read)]
    fn read_storage();
}

storage {
    s_u8: u8 = 0,
    s_u64: u64 = 0,
}

impl Abi for Contract {
    #[storage(read)]
    fn read_storage() {
        let _ = storage.s_u8.read();
        let _ = storage.s_u64.read();
    }
}