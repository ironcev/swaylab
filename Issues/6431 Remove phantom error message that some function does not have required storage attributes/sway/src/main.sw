script;

fn main() {
    asm (key: b256::zero(), is_set, val: 42) {
        sww key is_set val;
    }
}
