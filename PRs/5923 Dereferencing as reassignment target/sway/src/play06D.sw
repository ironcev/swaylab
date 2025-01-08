library;

#[inline(never)]
pub fn play() {
   non_mutable();
   mutable();
}

#[inline(never)]
pub fn non_mutable() {
   let x = 123u8;
}

#[inline(never)]
pub fn mutable() {
   let mut x = 123u8;
   x = 111;
}

// In both debug and release:
// pub fn non_mutable_1() -> (), !10 {
//     entry():
//     v0 = const unit ()
//     ret () v0
// }

// pub fn mutable_2() -> (), !12 {
//     entry():
//     v0 = const unit ()
//     ret () v0
// }