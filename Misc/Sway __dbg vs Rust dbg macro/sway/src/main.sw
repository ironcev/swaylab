script;

fn main() {
    let _ = add(11, 22);
    __dbg(side_effect());
}

#[inline(never)]
fn add(a: u64, b: u64) -> u64 {
    __dbg(a) + __dbg(b)
}

#[inline(never)]
fn side_effect() -> u64 {
    log("side effect");
    42
}

#[test]
fn test_add() {
    assert_eq(add(11, 22), 33);
}

#[test]
fn test_main() {
    main();
}