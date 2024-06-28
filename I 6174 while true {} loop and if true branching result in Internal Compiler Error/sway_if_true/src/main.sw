script;

#[inline(never)]
fn main() {
    let _x = if true { 42u64 } else { __revert(0) };
    let _x = __revert(42);
}
