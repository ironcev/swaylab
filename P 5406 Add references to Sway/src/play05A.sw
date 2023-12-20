library;

#[inline(never)]
pub fn play() {
    let a = true;
    let r1 = &a;
    let r2 = &false;
    let r1_addr = asm(r: r1) { r: raw_ptr };
    let r2_addr = asm(r: r2) { r: raw_ptr };
    assert(r1_addr != r2_addr);
}

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         local bool __anon_0
//         local bool a

//         entry():
//         v0 = get_local ptr bool, a, !7
//         v1 = const bool true, !8
//         store v1 to v0, !7
//         v2 = get_local ptr bool, a, !9
//         v3 = ptr_to_int v2 to u64, !10
//         v4 = get_local ptr bool, __anon_0
//         v5 = const bool false, !11
//         store v5 to v4
//         v6 = ptr_to_int v4 to u64, !12
//         v7 = asm(r: v3) -> u64 r, !13 {
//         }
//         v8 = asm(r: v6) -> u64 r, !14 {
//         }
//         v9 = cmp eq v7 v8, !18
//         v10 = const bool false, !19
//         v11 = cmp eq v9 v10, !21
//         v12 = const bool false, !19
//         v13 = cmp eq v11 v12, !25
//         cbr v13, assert_1_block0(), assert_1_block1(), !26

//         assert_1_block0():
//         v14 = const u64 18446744073709486084, !28
//         revert v14, !32

//         assert_1_block1():
//         v15 = const unit ()
//         ret () v15
//     }
// }

