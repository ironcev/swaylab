library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x = if b {
        return 1;
    } else {
        2
    };

    x
}

// pub fn play_0(b !5: bool) -> u64, !8 {
//     entry(b: bool):
//     cbr b, block0(), block1(), !9

//     block0():
//     v0 = const u64 1, !10
//     ret u64 v0, !11

//     block1():
//     v1 = const u64 2, !12
//     ret u64 v1
// }