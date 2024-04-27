library;

struct S {
    x: u64,
}

enum E {
    X: u64
}

#[inline(never)]
pub fn play() {
    let mut array = [1, 2, 3];

    array[0] = 0;

    array[0u8] = 0;

    array[0u16] = 0;

    array[0u32] = 0;

    array[0u64] = 0;

    array[true] = 0;

    array[false] = 0;

    array[()] = 0;

    array["test"] = 0;
    // error: Internal compiler error: Attempt to load from non-copy type.
    // But only if `poke(array)` is called.

    array[S { x: 0 }] = 0;
    
    array[E::X(0)] = 0;

    poke(array);
    poke(array[0]);
    poke(array[0u8]);
    poke(array[0u16]);
    poke(array[0u32]);
    poke(array[0u64]);
    poke(array[true]);
    poke(array[false]);
    poke(array[()]);
}

#[inline(never)]
fn poke<T>(_x: T) { }