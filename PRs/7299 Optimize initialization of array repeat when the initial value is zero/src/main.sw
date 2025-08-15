script;

fn main() {
    let _ = a();
    // let _ = b();
    let _ = c();
    // let _ = enormous_stack();
}

#[inline(never)]
fn a() -> [u8; 262143] {
    [0; 262143]
}

#[inline(never)]
fn b() -> [u8; 262144] {
    [0; 262144]
}

#[inline(never)]
fn c() -> [u8; 333333] {
    [0; 333333]
}

#[inline(never)]
fn enormous_stack() -> [u8; 4294967297] {
    [0; 4294967297]
    // thread 'main' panicked at sway-core/src/asm_generation/fuel/functions.rs:914:13:
    // not yet implemented: Enormous stack usage for locals.
}

#[test]
fn test_a() {
    let _ = a();
}