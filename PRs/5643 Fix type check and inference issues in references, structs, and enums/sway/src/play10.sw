library;

use core::ops::{Eq, Add};

enum FooG<T>
    where T: Eq
{
    Bar: ZoomG<T>,
}

enum ZoomG<T>
    where T: Eq
{
    Wow: T,
}

fn match_generic<T>(me: FooG<T>) -> T
where T: Eq + Add {
    match me {
        FooG::Bar(ZoomG::Wow(x)) => x + x,
    }
}

#[inline(never)]
pub fn play() -> u64 {
    let x = match_generic(FooG::Bar(ZoomG::Wow(21)));
    assert(x == 42);

    let x: u8 = match_generic(FooG::Bar(ZoomG::Wow(21)));
    assert(x == 42);

    let x = match_generic(FooG::Bar(ZoomG::Wow(21u8)));
    assert(x == 42);

    let x: u8 = match_generic(FooG::Bar(ZoomG::Wow(21u8)));
    assert(x == 42);

    123
}
