script;

fn main() {
	diverge_with_if_else(true);
	diverge_with_if_else(false);
}

fn diverge_with_if_else(b: bool) -> u64 {
    let x: u64 = if b {
        return 5;
    } else {
        return 1;
    };

    return x;
}

// fn diverge_with_if_else_0(b !6: bool) -> u64, !9 {
//     entry(b: bool):
//     cbr b, block0(), block1(), !10

//     block0():
//     v0 = const u64 5, !11
//     ret u64 v0, !12

//     block1():
//     v1 = const u64 1, !13
//     ret u64 v1, !14
// }

// fn diverge_with_if_else_0(b !6: bool) -> u64, !9 {
//     local u64 x

//     entry(b: bool):
//     cbr b, block0(), block1(), !10

//     block0():
//     v0 = const u64 5, !11
//     ret u64 v0, !12

//     block1():
//     v1 = const u64 1, !13
//     ret u64 v1, !14

//     block2(v2: u64):
//     v3 = get_local ptr u64, x, !15
//     store v2 to v3, !15
//     v4 = get_local ptr u64, x, !16
//     v5 = load v4
//     ret u64 v5, !17
// }

