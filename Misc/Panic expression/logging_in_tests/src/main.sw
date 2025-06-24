script;

fn main() {}

#[test]
fn test_fn() {
    let a = 10;
    log(a);
    let b = 30;
    log(b);
    assert_eq(a, 10);
    assert_eq(b, 30);
}

#[test(should_revert)]
fn test_meaning_of_life() {
    assert_eq(6 * 6, 42);
}
