library;

struct S<T> {}

impl<T> S<T> {
    fn new() -> Self {
        S::<T> {}
    }
}

#[inline(never)]
pub fn play() {
    let (_, _, _) = (0, 0, 0);
    let (a, _, _) = (0, 0, 0);
    let var = 0;
    let _ = 0;
    match (0, 0, 0) {
        _ => (),
        (_, _, _) => (),
        (a, _, _) => (),
    }

    let vec: S<_> = S::<u64>::new();
    let vec: S<u64> = S::<_>::new();

    // let x = _;
    //         ^ Expected an expression.

    // match _ {
    //       ^ Expected an expression.
    //     _ => (),
    // }
}

// fn f(_: u64) {}
//      ^ wildcard patterns not supported in this position