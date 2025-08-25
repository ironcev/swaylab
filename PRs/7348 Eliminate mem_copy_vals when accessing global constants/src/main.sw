script;

struct Struct {
    a: b256,
    b: b256,
}

const STRUCT: Struct = Struct { a: b256::zero(), b: b256::zero() };

const ADDRESS: b256 = 0x9999999999999999999999999999999999999999999999999999999999999999;

fn main() {
    // let local = Struct { a: b256::zero(), b: b256::zero() };
    // poke(local);
    // poke(local);

    poke(ADDRESS);
    // poke(ADDRESS);
    // poke(ADDRESS);

    // poke(asm(r: ADDRESS) {
    //     r: b256
    // });
}

#[inline(never)]
fn poke<T>(_t: T) { }
