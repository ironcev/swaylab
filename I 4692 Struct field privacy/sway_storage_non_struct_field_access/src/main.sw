contract;

storage {
    boolean: bool = true,
}

#[storage(read)]
fn read_storage() {
    let _ = storage.boolean.field.read();
}
