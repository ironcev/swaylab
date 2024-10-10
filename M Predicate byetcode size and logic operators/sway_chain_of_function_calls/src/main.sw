predicate;

fn main() -> bool {
    operator_chain();
    call_chain();
    true
}

#[inline(never)]
fn operator_chain() -> bool {
    let b = gt(1, 2) && gt(2, 3) && gt(3, 4);
    poke(b)
}

#[inline(never)]
fn call_chain() -> bool {
    let b = {
        gt(1, 2); gt(2, 3); gt(3, 4);
        true
    };
    poke(b)
}

#[inline(never)]
fn gt(a: u8, b: u8) -> bool {
    a > b
}

#[inline(never)]
fn poke(b: bool) -> bool {
    b
}