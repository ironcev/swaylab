use std::arch::asm;

fn main() {
    let mut x: u64 = 4;
    unsafe {
        asm!(
            ""
            // "mov {tmp}, {x}",
            // "shl {tmp}, 1",
            // "shl {x}, 2",
            // "add {x}, {tmp}",
            // x = inout(reg) x,
            // tmp = out(reg) _,
        );
        // error: requires at least a template string argument
    }
    assert_eq!(x, 4 * 6);
}
