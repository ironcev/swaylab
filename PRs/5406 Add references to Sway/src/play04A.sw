library;

struct S { }

impl core::ops::Eq for S {
    #[inline(never)]
    fn eq(self, other: Self) -> bool {
        true
    }
}

#[inline(never)]
pub fn play() {
    let s = S { };
    let r1 = &s;
    let r2 = &S { };
    let r1_addr = asm(r: r1) { r: raw_ptr };
    let r2_addr = asm(r: r2) { r: raw_ptr };
    assert(r1_addr == r2_addr); // Zero-sized types are on the same place in memory in this example.
    assert(*r1 == *r2);
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
//         local {  } __tmp_arg
//         local {  } __tmp_arg0

//         entry():
//         v0 = get_local ptr {  }, __anon_0, !7
//         v1 = ptr_to_int v0 to u64, !8
//         v2 = get_local ptr {  }, __anon_1, !9
//         v3 = ptr_to_int v2 to u64, !10
//         v4 = asm(r: v1) -> u64 r, !11 {
//         }
//         v5 = asm(r: v3) -> u64 r, !12 {
//         }
//         v6 = cmp eq v4 v5, !13
//         v7 = call assert_1(v6), !14
//         v8 = int_to_ptr v1 to ptr {  }, !15
//         v9 = int_to_ptr v3 to ptr {  }, !16
//         v10 = get_local ptr {  }, __tmp_arg
//         mem_copy_val v10, v8
//         v11 = get_local ptr {  }, __tmp_arg0
//         mem_copy_val v11, v9
//         v12 = call eq_5(v10, v11)
//         v13 = call assert_1(v12), !17
//         v14 = const unit ()
//         ret () v14
//     }

//     pub fn assert_1(condition !19: bool) -> (), !20 {
//         entry(condition: bool):
//         v0 = const bool false, !22
//         v1 = cmp eq condition v0, !23
//         cbr v1, block0(), block1(), !23

//         block0():
//         v2 = const u64 18446744073709486084, !25
//         revert v2, !29

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     pub fn eq_5(self: ptr {  }, other: ptr {  }) -> bool, !31 {
//         entry(self: ptr {  }, other: ptr {  }):
//         v0 = const bool true, !32
//         ret bool v0
//     }
// }