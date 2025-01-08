library;

#[inline(never)]
#[storage(read)]
pub fn play() {
    write_storage_word();
}

fn write_storage_word() {
    asm (key: b256::zero(), is_set, val: 42) {
        sww key is_set val;
    }
}
