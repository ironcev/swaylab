fn main() {
    let _ = add(11, 22);
    dbg!(side_effect());
    side_effect();
}

#[inline(never)]
fn add(a: u64, b: u64) -> u64 {
    dbg!(a) + dbg!(b)
}

#[inline(never)]
fn side_effect() -> std::io::Result<usize> {
    println!("side effect");
    use std::io::Write;
    let mut out = std::io::stdout();
    out.write(&[0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x21])
}

#[test]
fn test_add() {
    assert_eq!(add(11, 22), 33);
}

#[test]
fn test_main() {
    main();
}