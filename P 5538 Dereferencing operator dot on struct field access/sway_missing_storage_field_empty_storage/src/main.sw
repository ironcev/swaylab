contract;

storage {
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
