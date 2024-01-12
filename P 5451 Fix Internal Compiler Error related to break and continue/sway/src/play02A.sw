library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x = if b {
        1
    } else {
        2
    };

    x
}

// pub fn play_0(b !5: bool) -> u64, !8 {
//     entry(b: bool):
//     v0 = const u64 1, !9
//     cbr b, block2(v0), block1(), !10

//     block1():
//     v1 = const u64 2, !11
//     br block2(v1)

//     block2(v2: u64):
//     ret u64 v2
// }