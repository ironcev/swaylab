script;

struct Struct {
    x: u64,
    y: u64,
}

fn main() {
    // play_01();
    // play_02();
    // play_03();
    // play_04();
    // play_05();
    play_06();
}

#[inline(never)]
fn play_01() {
    let x = 112233;
    let r_x = &x;
    take_ref(r_x);
}

#[inline(never)]
fn play_02() {
    let x = 112233;
    take_ref(&x);
}

#[inline(never)]
fn play_03() {
    let mut x = 112233;
    take_ref_mut(x);
}

#[inline(never)]
fn play_04() {
    let mut x = Struct { x: 1111, y: 2222 };
    take_ref_mut_struct(x);
}

#[inline(never)]
fn play_05() {
    let x = Struct { x: 1111, y: 2222 };
    let p_x = __addr_of(x);
    take_ptr(p_x);
}

#[inline(never)]
fn play_06() {
    let mut x = Struct { x: 1111, y: 2222 };
    take_ref_struct(&mut x);
}

#[inline(never)]
fn take_ref(_r_u64: &u64) {
}

#[inline(never)]
fn take_ref_mut(ref mut r_u64: u64) {
    r_u64 = 4444;
}

#[inline(never)]
fn take_ref_mut_struct(ref mut r_struct: Struct) {
    r_struct.x = 4444;
}

// fn take_ref_mut_struct_1(r_struct !11: ptr { u64, u64 }) -> (), !13 {
//     entry(r_struct: ptr { u64, u64 }):
//     v0 = const u64 0
//     v1 = get_elem_ptr r_struct, ptr u64, v0, !14
//     v2 = const u64 4444, !15
//     store v2 to v1, !14
//     v3 = const unit ()
//     ret () v3
// }

#[inline(never)]
fn take_ptr(_p_struct: raw_ptr) {
}

#[inline(never)]
fn take_ref_struct(r_struct: &mut Struct) {
    poke(r_struct.x);
}

#[inline(never)]
fn poke<T>(_x: T) {}