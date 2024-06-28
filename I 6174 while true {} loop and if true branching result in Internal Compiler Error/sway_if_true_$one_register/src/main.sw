script;

#[inline(never)]
fn main() {
    let _x = if true { 42u64 } else { 24u64 };
    let _x = if false { 42u64 } else { 24u64 };
}
