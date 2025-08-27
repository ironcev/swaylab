contract;

storage {
    scalar: u64 = 0,
}

impl Contract {
    #[storage(read)]
    fn access_scalar_read() {
        let _ = (storage.scalar.read(), storage.scalar.read());
    }
}
