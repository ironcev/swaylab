library;

const KEY: b256 = 0xfefefefefefefefefefefefefefefefefefefefefefefefefefefefefefefefe;

#[inline(never)]
pub fn play() {
    write_storage_word();
}

fn write_storage_word() {
    asm (key: KEY, is_set, val: 42) {
        sww key is_set val;
    }
}
