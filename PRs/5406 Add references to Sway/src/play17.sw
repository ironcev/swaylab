library;

use core::ops::Eq;

trait New {
    fn new() -> Self;
}

impl New for u256 {
    fn new() -> Self {
        0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20_u256
    }
}

#[inline(always)]
fn reference_local_var_and_value<T>()
    where T: Eq + New
{
    let x = T::new();

    let r_x_1 = &x;
    let r_x_2 = &x;
    let r_val = &T::new();

    let r_x_1_ptr = asm(r: r_x_1) { r: raw_ptr };
    let r_x_2_ptr = asm(r: r_x_2) { r: raw_ptr };
    let r_val_ptr = asm(r: r_val) { r: raw_ptr };

    assert(r_x_1_ptr == r_x_2_ptr);
    assert(r_x_1_ptr != r_val_ptr);

    let r_x_1_ptr_val = r_x_1_ptr.read::<T>();
    let r_x_2_ptr_val = r_x_2_ptr.read::<T>();
    let r_x_val_val = r_val_ptr.read::<T>();

    assert(r_x_1_ptr_val == x);
    assert(r_x_2_ptr_val == x);
    assert(r_x_val_val == T::new());
}

#[inline(never)]
pub fn play() {
    reference_local_var_and_value::<u256>();
}

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         local u256 __const1 = const u256 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
//         local u256 __ret_val
//         local u256 __ret_val0
//         local u256 __ret_val1
//         local u256 r_x_1_ptr_val
//         local u256 r_x_2_ptr_val
//         local u256 r_x_val_val

//         entry():
//         v0 = get_local ptr u256, __const1, !9
//         v1 = ptr_to_int v0 to u64, !11
//         v2 = get_local ptr u256, __const1, !13
//         v3 = ptr_to_int v2 to u64, !15
//         v4 = get_local ptr u256, __const1, !7
//         v5 = ptr_to_int v4 to u64, !17
//         v6 = asm(r: v1) -> u64 r, !19 {
//         }
//         v7 = asm(r: v3) -> u64 r, !21 {
//         }
//         v8 = asm(r: v5) -> u64 r, !23 {
//         }
//         v9 = cmp eq v6 v7, !25
//         v10 = call assert_3(v9), !27
//         v11 = cmp eq v6 v8, !31
//         v12 = const bool false, !32
//         v13 = cmp eq v11 v12, !34
//         v14 = call assert_3(v13), !36
//         v15 = get_local ptr u256, __ret_val
//         v16 = call read_10(v6, v15)
//         v17 = get_local ptr u256, r_x_1_ptr_val, !38
//         mem_copy_val v17, v16
//         v18 = get_local ptr u256, __ret_val0
//         v19 = call read_10(v7, v18)
//         v20 = get_local ptr u256, r_x_2_ptr_val, !40
//         mem_copy_val v20, v19
//         v21 = get_local ptr u256, __ret_val1
//         v22 = call read_10(v8, v21)
//         v23 = get_local ptr u256, r_x_val_val, !42
//         mem_copy_val v23, v22
//         v24 = get_local ptr u256, r_x_1_ptr_val, !7
//         v25 = get_local ptr u256, __const1, !7
//         v26 = wide cmp eq v24 v25, !44
//         v27 = call assert_3(v26), !46
//         v28 = get_local ptr u256, r_x_2_ptr_val, !7
//         v29 = get_local ptr u256, __const1, !7
//         v30 = wide cmp eq v28 v29, !48
//         v31 = call assert_3(v30), !50
//         v32 = get_local ptr u256, r_x_val_val, !7
//         v33 = get_local ptr u256, __const1
//         v34 = wide cmp eq v32 v33, !52
//         v35 = call assert_3(v34), !54
//         v36 = const unit ()
//         ret () v36
//     }

//     pub fn assert_3(condition !56: bool) -> (), !57 {
//         entry(condition: bool):
//         v0 = const bool false, !32
//         v1 = cmp eq condition v0, !58
//         cbr v1, block0(), block1(), !58

//         block0():
//         v2 = const u64 18446744073709486084, !60
//         revert v2, !64

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     pub fn read_10(self !66: u64, __ret_value: ptr u256) -> ptr u256, !67 {
//         entry(self: u64, __ret_value: ptr u256):
//         v0 = asm(ptr: self) -> ptr u256 ptr {
//         }
//         mem_copy_val __ret_value, v0
//         ret ptr u256 __ret_value
//     }
// }
