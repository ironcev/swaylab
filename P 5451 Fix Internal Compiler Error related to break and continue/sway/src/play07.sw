library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x: u64 = if b {
        return 55;
    } else {
        return 11;
    };

    return x;
}

// With the bug fix, and CFG simplification, as expected:
// pub fn play_0(b !5: bool) -> u64, !8 {
//     entry(b: bool):
//     cbr b, block0(), block1(), !9

//     block0():
//     v0 = const u64 55, !10
//     ret u64 v0, !11

//     block1():
//     v1 = const u64 11, !12
//     ret u64 v1, !13
// }


// Without CFG simplification:
// pub fn play_0(b !5: bool) -> u64, !8 {
//     local u64 x

//     entry(b: bool):
//     cbr b, block0(), block1(), !9

//     block0():
//     v0 = const u64 55, !10
//     ret u64 v0, !11

//     block1():
//     v1 = const u64 11, !12
//     ret u64 v1, !13

//     block2(v2: u64): // u64 ??????
//     v3 = get_local ptr u64, x, !14
//     store v2 to v3, !14
//     v4 = get_local ptr u64, x, !15
//     v5 = load v4
//     ret u64 v5, !16
// }