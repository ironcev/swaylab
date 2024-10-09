predicate;

fn main() -> bool {
    true

    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)

    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)

    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)

    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
    && boolean_fun(1, 2)
}

#[inline(never)]
fn boolean_fun(a: u64, b: u64) -> bool {
    a > b
}
