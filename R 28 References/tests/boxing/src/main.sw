script;

mod box;
use ::box::NBox;
use ::box::PBox;

struct A {
    a: u64,
}

struct B {
    a: A,
    x: (u64, u64)
}

fn main() -> u64 {
    let ret = naive_boxing();
    assert(ret == 42);

    let ret = ptr_boxing();
    assert(ret == 42);

    let ret = ptr_no_issue();
    assert(ret == 42);

    let ret = ptr_issue();
    assert(ret == 42);

    ret
}

#[inline(never)]
fn naive_boxing() -> u64 {
    let a = A { a: 11 };
    let mut b = B { a: a, x: (11, 11) };

    let mut ref_b_1 = NBox::new(b);
    let mut ref_b_2 = NBox::new(b);

    b.x.0 = 111;
    ref_b_1.val.x.0 = 222;
    ref_b_2.val.x.0 = 333;
    assert(b.x.0 == 111);
    assert(ref_b_1.val.x.0 == 222);
    assert(ref_b_2.val.x.0 == 333);

    b.a.a = 111;
    ref_b_1.val.a.a = 222;
    ref_b_2.val.a.a = 333;
    assert(b.a.a == 111);
    assert(ref_b_1.val.a.a == 222);
    assert(ref_b_2.val.a.a == 333);

    42
}

#[inline(never)]
fn ptr_boxing() -> u64 {
    let a = A { a: 11 };
    let mut b = B { a: a, x: (11, 11) };

    let mut ref_b_1 = PBox::new(b);
    let mut ref_b_2 = PBox::new(b);

    // ERROR: ^^^^^^^^^^^^^^^^^ This expression cannot be assigned to.
    // b.x.0 = 111;
    // ref_b_1.val().x.0 = 222;
    // ref_b_2.val().x.0 = 333;
    // ^^^^^^^^^^^^^^^^^ This expression cannot be assigned to.
    // assert(b.x.0 == 333);
    // assert(ref_b_1.val().x.0 == 333);
    // assert(ref_b_2.val().x.0 == 333);

    // b.a.a = 111;
    // ref_b_1.val().a.a = 222;
    // ref_b_2.val().a.a = 333;
    // assert(b.a.a == 333);
    // assert(ref_b_1.val().a.a == 333);
    // assert(ref_b_2.val().a.a == 333);

    b.x.0 = 111;
    assert(b.x.0 == 111);
    // assert(ref_b_1.val().x.0 == 111); // FAILES: Result is 11, the old value!
    // The reason is that b.x.0 is actually not changed!
    // The change is optimized away and the assert becomes directly (111 == 111).
    // assert(ref_b_2.val().x.0 == 111);

    b.a.a = 111;
    assert(b.a.a == 111);
    // assert(ref_b_1.val().a.a == 111);
    // assert(ref_b_2.val().a.a == 111);

    42
}

#[inline(never)]
fn ptr_no_issue() -> u64 {
    let a = A { a: 11 };
    let mut b = B { a: a, x: (11, 11) };

    let mut ptr_b = __addr_of(b);

    b.x.0 = 111;
    assert(b.x.0 == 111);
    assert(ptr_b.read::<B>().x.0 == 111);

    42
}

#[inline(never)]
fn ptr_issue() -> u64 {
    let a = A { a: 11 };
    let mut b = B { a: a, x: (11, 11) };

    let mut ptr_b = ptr(b);

    b.x.0 = 111;
    assert(b.x.0 == 111);
    // FAILS: b is not changed at all.
    assert(ptr_b.read::<B>().x.0 == 111);

    42
}

#[test]
fn ptr_issue_test() -> u64 {
    let a = A { a: 11 };
    let mut b = B { a: a, x: (11, 11) };

    let mut ptr_b = ptr(b);

    b.x.0 = 111;
    assert(b.x.0 == 111);
    // FAILS: b is not changed at all.
    assert(ptr_b.read::<B>().x.0 == 111);

    42
}
// #[inline(never)] // It fails regardless of `ptr<T>` being inlined or not.
fn ptr<T>(t: T) -> raw_ptr {
    __addr_of(t)
}

// script {
//     entry fn main() -> u64, !1 {
//         entry():
//         v0 = call naive_boxing_0(), !2
//         v1 = const u64 42, !3
//         v2 = cmp eq v0 v1, !4
//         v3 = call assert_3(v2), !5
//         v4 = call ptr_boxing_11(), !6
//         v5 = const u64 42, !7
//         v6 = cmp eq v4 v5, !8
//         v7 = call assert_3(v6), !9
//         v8 = call ptr_no_issue_18(), !10
//         v9 = const u64 42, !11
//         v10 = cmp eq v8 v9, !12
//         v11 = call assert_3(v10), !13
//         v12 = call ptr_issue_24(), !14
//         v13 = const u64 42, !15
//         v14 = cmp eq v12 v13, !16
//         v15 = call assert_3(v14), !17
//         ret u64 v12
//     }

//     fn naive_boxing_0() -> u64, !20 {
//         entry():
//         v0 = const u64 111, !21
//         v1 = const u64 111, !22
//         v2 = cmp eq v0 v1, !23
//         v3 = call assert_3(v2), !24
//         v4 = const u64 222, !25
//         v5 = const u64 222, !26
//         v6 = cmp eq v4 v5, !27
//         v7 = call assert_3(v6), !28
//         v8 = const u64 333, !29
//         v9 = const u64 333, !30
//         v10 = cmp eq v8 v9, !31
//         v11 = call assert_3(v10), !32
//         v12 = const u64 111, !33
//         v13 = const u64 111, !34
//         v14 = cmp eq v12 v13, !35
//         v15 = call assert_3(v14), !36
//         v16 = const u64 222, !37
//         v17 = const u64 222, !38
//         v18 = cmp eq v16 v17, !39
//         v19 = call assert_3(v18), !40
//         v20 = const u64 333, !41
//         v21 = const u64 333, !42
//         v22 = cmp eq v20 v21, !43
//         v23 = call assert_3(v22), !44
//         v24 = const u64 42, !45
//         ret u64 v24
//     }

//     pub fn assert_3(condition !47: bool) -> (), !48 {
//         entry(condition: bool):
//         v0 = const bool false, !50
//         v1 = cmp eq condition v0, !51
//         cbr v1, block0(), block1(), !51

//         block0():
//         v2 = const u64 18446744073709486084, !53
//         revert v2, !57

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     fn ptr_boxing_11() -> u64, !59 {
//         entry():
//         v0 = const u64 111, !60
//         v1 = const u64 111, !61
//         v2 = cmp eq v0 v1, !62
//         v3 = call assert_3(v2), !63
//         v4 = const u64 111, !64
//         v5 = const u64 111, !65
//         v6 = cmp eq v4 v5, !66
//         v7 = call assert_3(v6), !67
//         v8 = const u64 42, !68
//         ret u64 v8
//     }

//     fn ptr_no_issue_18() -> u64, !70 {
//         local mut { { u64 }, { u64, u64 } } b

//         entry():
//         v0 = get_local ptr { { u64 }, { u64, u64 } }, b, !71
//         v1 = const u64 0
//         v2 = const u64 0
//         v3 = get_elem_ptr v0, ptr u64, v1, v2
//         v4 = const u64 11, !72
//         store v4 to v3
//         v5 = const u64 1
//         v6 = const u64 0
//         v7 = get_elem_ptr v0, ptr u64, v5, v6
//         v8 = const u64 11, !73
//         store v8 to v7
//         v9 = const u64 1
//         v10 = const u64 1
//         v11 = get_elem_ptr v0, ptr u64, v9, v10
//         v12 = const u64 11, !74
//         store v12 to v11
//         v13 = get_local ptr { { u64 }, { u64, u64 } }, b, !75
//         v14 = ptr_to_int v13 to u64, !76
//         v15 = get_local ptr { { u64 }, { u64, u64 } }, b, !77
//         v16 = const u64 1
//         v17 = const u64 0
//         v18 = get_elem_ptr v15, ptr u64, v16, v17, !77
//         v19 = const u64 111, !78
//         store v19 to v18, !77
//         v20 = get_local ptr { { u64 }, { u64, u64 } }, b, !79
//         v21 = const u64 1
//         v22 = get_elem_ptr v20, ptr { u64, u64 }, v21, !80
//         v23 = const u64 0
//         v24 = get_elem_ptr v22, ptr u64, v23, !81
//         v25 = load v24
//         v26 = const u64 111, !82
//         v27 = cmp eq v25 v26, !83
//         v28 = call assert_3(v27), !84
//         v29 = asm(ptr: v14) -> ptr { { u64 }, { u64, u64 } } ptr {
//         }
//         v30 = const u64 1
//         v31 = const u64 0
//         v32 = get_elem_ptr v29, ptr u64, v30, v31
//         v33 = load v32
//         v34 = const u64 111, !85
//         v35 = cmp eq v33 v34, !86
//         v36 = call assert_3(v35), !87
//         v37 = const u64 42, !88
//         ret u64 v37
//     }

//     fn ptr_issue_24() -> u64, !90 {
//         local { { u64 }, { u64, u64 } } __ptr_to_int_arg

//         entry():
//         v0 = get_local ptr { { u64 }, { u64, u64 } }, __ptr_to_int_arg
//         v1 = const u64 0
//         v2 = const u64 0
//         v3 = get_elem_ptr v0, ptr u64, v1, v2
//         v4 = const u64 11, !91
//         store v4 to v3
//         v5 = const u64 1
//         v6 = const u64 0
//         v7 = get_elem_ptr v0, ptr u64, v5, v6
//         v8 = const u64 11, !92
//         store v8 to v7
//         v9 = const u64 1
//         v10 = const u64 1
//         v11 = get_elem_ptr v0, ptr u64, v9, v10
//         v12 = const u64 11, !93
//         store v12 to v11
//         v13 = ptr_to_int v0 to u64, !96
//         v14 = const u64 111, !97
//         v15 = const u64 111, !98
//         v16 = cmp eq v14 v15, !99
//         v17 = call assert_3(v16), !100
//         v18 = asm(ptr: v13) -> ptr { { u64 }, { u64, u64 } } ptr {
//         }
//         v19 = const u64 1
//         v20 = const u64 0
//         v21 = get_elem_ptr v18, ptr u64, v19, v20
//         v22 = load v21
//         v23 = const u64 111, !101
//         v24 = cmp eq v22 v23, !102
//         v25 = call assert_3(v24), !103
//         v26 = const u64 42, !104
//         ret u64 v26
//     }
// }
