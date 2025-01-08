script;

trait Shift {
    fn function(self) -> u64;
}

impl Shift for u64 {
    fn lsh(self, other: u64) -> Self {
        asm(r1 : self, r2: other, r3) {
            sll r3 r1 r2;
            r3: u64
        }
    }

    fn rsh(self, other: u64) -> Self {
        asm(r1 : self, r2: other, r3) {
            srl r3 r1 r2;
            r3: u64
        }
    }
}

fn main() -> u64 {
  100 << 2
}

// error
//   --> /home/kebradalaonda/p/swaylab/M Reimplementing traits/sway_impl_local_shift/src/main.sw:8:8
//    |
//  6 | 
//  7 | impl Shift for u64 {
//  8 |     fn lsh(self, other: u64) -> Self {
//    |        ^^^ Function "lsh" is not a part of trait "Shift"'s interface surface.
//  9 |         asm(r1 : self, r2: other, r3) {
// 10 |             sll r3 r1 r2;
//    |
// ____

// error
//   --> /home/kebradalaonda/p/swaylab/M Reimplementing traits/sway_impl_local_shift/src/main.sw:15:8
//    |
// 13 | 
// 14 | 
// 15 |     fn rsh(self, other: u64) -> Self {
//    |        ^^^ Function "rsh" is not a part of trait "Shift"'s interface surface.
// 16 |         asm(r1 : self, r2: other, r3) {
// 17 |             srl r3 r1 r2;
//    |
// ____

// error
//   --> /home/kebradalaonda/p/swaylab/M Reimplementing traits/sway_impl_local_shift/src/main.sw:7:1
//    |
//  5 |   
//  6 |   
//  7 | / impl Shift for u64 {
//  8 | |     fn lsh(self, other: u64) -> Self {
//  9 | |         asm(r1 : self, r2: other, r3) {
// 10 | |             sll r3 r1 r2;
// 11 | |             r3: u64
// 12 | |         }
// 13 | |     }
// 14 | | 
// 15 | |     fn rsh(self, other: u64) -> Self {
// 16 | |         asm(r1 : self, r2: other, r3) {
// 17 | |             srl r3 r1 r2;
// 18 | |             r3: u64
// 19 | |         }
// 20 | |     }
// 21 | | }
//    | |_^ Functions are missing from this trait implementation: function
// 22 |   
// 23 |   fn main() -> u64 {
