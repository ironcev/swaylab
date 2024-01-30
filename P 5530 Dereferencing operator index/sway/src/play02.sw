library;

#[inline(never)]
pub fn play() {
    let array = [1, 2, 3];

    let r_r_array = & &array;

    let val = r_r_array[0];

    poke(val);
}

#[inline(never)]
fn poke<T>(_x: T) { }

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         local [u64; 3] __anon_0
//         local u64 __anon_1
//         local u64 r_r_array
//         local u64 val

//         entry():
//         v0 = get_local ptr [u64; 3], __anon_0, !7
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 1, !8
//         store v3 to v2, !7
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 2, !9
//         store v6 to v5, !7
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, ptr u64, v7
//         v9 = const u64 3, !10
//         store v9 to v8, !7
//         v10 = get_local ptr [u64; 3], __anon_0, !11
//         v11 = ptr_to_int v10 to u64, !12
//         v12 = get_local ptr u64, __anon_1
//         store v11 to v12
//         v13 = ptr_to_int v12 to u64, !13
//         v14 = get_local ptr u64, r_r_array, !14
//         store v13 to v14, !14
//         v15 = get_local ptr u64, r_r_array, !15
//         v16 = load v15
//         v17 = int_to_ptr v16 to ptr u64, !15
//         v18 = load v17
//         v19 = int_to_ptr v18 to ptr [u64; 3], !15
//         v20 = const u64 0, !16
//         v21 = get_elem_ptr v19, ptr u64, v20, !17
//         v22 = get_local ptr u64, val, !18
//         mem_copy_val v22, v21
//         v23 = get_local ptr u64, val, !19
//         v24 = load v23
//         v25 = call poke_1(v24), !20
//         v26 = const unit ()
//         ret () v26
//     }

//     fn poke_1(_x !21: u64) -> (), !23 {
//         entry(_x: u64):
//         v0 = const unit ()
//         ret () v0
//     }
// }
