library;

enum E1 {
    A: (),
}

enum GE1<T> {
    A: T,
}

#[inline(never)]
pub fn play() {
    // let _ = E1::A;
    // let _: E1 = E1::A;

    // let _ = GE1::<u64>::A(0u64);
    let _ = GE1::A(0u64);
    // let _: GE1::<u64> = GE1::<u64>::A(0u64);
}
