library;

struct S { }

#[inline(never)]
pub fn play() {
    let s = S { };
    let r1 = &s;
    let r2 = &S { };
    let r_r_1 = &r1;
    let r_r_2 = &r2;
    let r_r_a = & &s;
    let r_r_b = & &s;
    let r_r2 = & &S { };
    
    log(r_r_1);
    log(r_r_2);
    log(r_r_a);
    log(r_r_b);
    log(r_r2);
}

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         local {  } __anon_0
//         local {  } __anon_1

//         entry():
//         v0 = get_local ptr {  }, __anon_0, !7
//         v1 = ptr_to_int v0 to u64, !8
//         v2 = get_local ptr {  }, __anon_1, !9
//         v3 = ptr_to_int v2 to u64, !10
//         v4 = asm(r: v1) -> u64 r, !11 {
//         }
//         v5 = asm(r: v3) -> u64 r, !12 {
//         }
//         v6 = cmp eq v4 v5, !16
//         v7 = const bool false, !17
//         v8 = cmp eq v6 v7, !19
//         v9 = const bool false, !17
//         v10 = cmp eq v8 v9, !23
//         cbr v10, assert_1_block0(), assert_1_block1(), !24

//         assert_1_block0():
//         v11 = const u64 18446744073709486084, !26
//         revert v11, !30

//         assert_1_block1():
//         v12 = const unit ()
//         ret () v12
//     }
// }
