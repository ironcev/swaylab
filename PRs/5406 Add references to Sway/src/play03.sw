library;

struct S { }

struct A {
    x: u64,
}

#[inline(never)]
pub fn play() {
    let s = S { };
    let p1 = __addr_of(s);
    let p2 = __addr_of(S { });
    assert(p1 != p2);

    let a = A { x: 123 };
    let p1 = __addr_of(a);
    let p2 = __addr_of(A { x: 321 });
    assert(p1 != p2);
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
//         local { u64 } __anon_2
//         local { u64 } __anon_3

//         entry():
//         v0 = get_local ptr {  }, __anon_0, !7
//         v1 = ptr_to_int v0 to u64, !8
//         v2 = get_local ptr {  }, __anon_1, !9
//         v3 = ptr_to_int v2 to u64, !10
//         v4 = call neq_4(v1, v3), !11
//         v5 = call assert_1(v4), !12
//         v6 = get_local ptr { u64 }, __anon_2, !13
//         v7 = const u64 0
//         v8 = get_elem_ptr v6, ptr u64, v7
//         v9 = const u64 123, !14
//         store v9 to v8, !13
//         v10 = get_local ptr { u64 }, __anon_2, !15
//         v11 = ptr_to_int v10 to u64, !16
//         v12 = get_local ptr { u64 }, __anon_3, !17
//         v13 = const u64 0
//         v14 = get_elem_ptr v12, ptr u64, v13
//         v15 = const u64 321, !18
//         store v15 to v14, !17
//         v16 = ptr_to_int v12 to u64, !19
//         v17 = call neq_4(v11, v16), !20
//         v18 = call assert_1(v17), !21
//         v19 = const unit ()
//         ret () v19
//     }

//     pub fn assert_1(condition !23: bool) -> (), !24 {
//         entry(condition: bool):
//         v0 = const bool false, !26
//         v1 = cmp eq condition v0, !27
//         cbr v1, block0(), block1(), !27

//         block0():
//         v2 = const u64 18446744073709486084, !29
//         revert v2, !33

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     pub fn neq_4(self !34: u64, other !35: u64) -> bool, !36 {
//         entry(self: u64, other: u64):
//         v0 = cmp eq self other, !37
//         v1 = const bool false, !26
//         v2 = cmp eq v0 v1, !38
//         ret bool v2
//     }
// }
