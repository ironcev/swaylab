library;

struct S {
    x: u8,
}

#[inline(never)]
pub fn play() {
    reference_copy_parameter(123u8);
    reference_aggregate_parameter(S { x: 123u8 });
}

#[inline(never)]
pub fn reference_copy_parameter(x: u8) {
    let r_x_1 = &x;
    let r_x_2 = &x;

    log(r_x_1);
    log(r_x_2);
}

#[inline(never)]
pub fn reference_aggregate_parameter(x: S) {
    let r_x_1 = &x;
    let r_x_2 = &x;

    log(r_x_1);
    log(r_x_2);
}

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         local { u8 } __tmp_arg

//         entry():
//         v0 = const u8 123, !7
//         v1 = call reference_copy_parameter_1(v0), !8
//         v2 = get_local ptr { u8 }, __tmp_arg
//         v3 = const u64 0
//         v4 = get_elem_ptr v2, ptr u8, v3
//         v5 = const u8 123, !9
//         store v5 to v4
//         v6 = call reference_aggregate_parameter_4(v2)
//         v7 = const unit ()
//         ret () v7
//     }

//     pub fn reference_copy_parameter_1(x !10: u8) -> (), !12 {
//         local u8 __anon_0
//         local u8 __anon_1

//         entry(x: u8):
//         v0 = get_local ptr u8, __anon_0
//         store x to v0
//         v1 = ptr_to_int v0 to u64, !13
//         v2 = get_local ptr u8, __anon_1
//         store x to v2
//         v3 = ptr_to_int v2 to u64, !14
//         v4 = const u64 0
//         log u64 v1, v4, !18
//         v5 = const u64 1
//         log u64 v3, v5, !20
//         v6 = const unit ()
//         ret () v6
//     }

//     pub fn reference_aggregate_parameter_4(x: ptr { u8 }) -> (), !22 {
//         entry(x: ptr { u8 }):
//         v0 = ptr_to_int x to u64, !23
//         v1 = ptr_to_int x to u64, !24
//         v2 = const u64 2
//         log u64 v0, v2, !26
//         v3 = const u64 3
//         log u64 v1, v3, !28
//         v4 = const unit ()
//         ret () v4
//     }
// }