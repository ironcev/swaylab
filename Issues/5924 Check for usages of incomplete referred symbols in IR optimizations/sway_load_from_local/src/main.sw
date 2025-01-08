script;

fn main() {
    b256_play();
    //struct_play();
}

#[inline(never)]
fn b256_play() {
    let local = 0x1f212e1f2e7b5a8cff18d994b7b7faa61db1a89cbf697facc518f6b6c8430196;
    let _ = take_b256(local);
}

#[inline(never)]
fn take_b256(_x: b256) -> b256 {
    0x0000000000000000000000000000000000000000000000000000000000000000
}

struct S {
    x: u64,
    y: u64,
}

#[inline(never)]
fn struct_play() {
    let local = S { x: 112233, y: 445566 };
    let _ = take_struct(local);
}

#[inline(never)]
fn take_struct(_x: S) -> S {
    S { x: 0, y: 0 }
}
