library;

struct EmptyStruct { }

struct Struct {
    x: u8,
    y: u64,
}

#[inline(never)]
pub fn play() {
    deref_copy_type();
    deref_struct();
}

#[inline(never)]
pub fn deref_copy_type() {
    let r_1: &u8 = &123;
    let r_2: &u64 = &123;

    let v_r_1 = *r_1;
    let v_r_2 = *r_2;

    log(v_r_1);
    log(v_r_2);
}

#[inline(never)]
pub fn deref_struct() {
    let r_1: &Struct = &Struct { x: 111, y: 122 };
    let r_2: &Struct = &Struct { x: 211, y: 222 };

    let v_r_1 = *r_1;
    let v_r_2 = *r_2;

    log(v_r_1);
    log(v_r_2);
}

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         entry():
//         v0 = call deref_copy_type_1(), !7
//         v1 = call deref_struct_4(), !8
//         v2 = const unit ()
//         ret () v2
//     }

//     pub fn deref_copy_type_1() -> (), !10 {
//         local u8 __anon_0
//         local u64 __anon_1

//         entry():
//         v0 = get_local ptr u8, __anon_0
//         v1 = const u8 123, !11
//         store v1 to v0
//         v2 = ptr_to_int v0 to u64, !12
//         v3 = get_local ptr u64, __anon_1
//         v4 = const u64 123, !13
//         store v4 to v3
//         v5 = ptr_to_int v3 to u64, !14
//         v6 = int_to_ptr v2 to ptr u8, !15
//         v7 = load v6
//         v8 = int_to_ptr v5 to ptr u64, !16
//         v9 = load v8
//         v10 = const u64 0
//         log u8 v7, v10, !20
//         v11 = const u64 1
//         log u64 v9, v11, !22
//         v12 = const unit ()
//         ret () v12
//     }

//     pub fn deref_struct_4() -> (), !24 {
//         local { u8, u64 } __anon_0
//         local { u8, u64 } __anon_1
//         local { u8, u64 } v_r_1
//         local { u8, u64 } v_r_2

//         entry():
//         v0 = get_local ptr { u8, u64 }, __anon_0, !25
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u8, v1
//         v3 = const u8 111, !26
//         store v3 to v2, !25
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 122, !27
//         store v6 to v5, !25
//         v7 = ptr_to_int v0 to u64, !28
//         v8 = get_local ptr { u8, u64 }, __anon_1, !29
//         v9 = const u64 0
//         v10 = get_elem_ptr v8, ptr u8, v9
//         v11 = const u8 211, !30
//         store v11 to v10, !29
//         v12 = const u64 1
//         v13 = get_elem_ptr v8, ptr u64, v12
//         v14 = const u64 222, !31
//         store v14 to v13, !29
//         v15 = ptr_to_int v8 to u64, !32
//         v16 = int_to_ptr v7 to ptr { u8, u64 }, !33
//         v17 = get_local ptr { u8, u64 }, v_r_1, !34
//         mem_copy_val v17, v16
//         v18 = int_to_ptr v15 to ptr { u8, u64 }, !35
//         v19 = get_local ptr { u8, u64 }, v_r_2, !36
//         mem_copy_val v19, v18
//         v20 = get_local ptr { u8, u64 }, v_r_1
//         v21 = const u64 2
//         log ptr { u8, u64 } v20, v21
//         v22 = get_local ptr { u8, u64 }, v_r_2
//         v23 = const u64 3
//         log ptr { u8, u64 } v22, v23
//         v24 = const unit ()
//         ret () v24
//     }
// }
