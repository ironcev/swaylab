script;

// Round #1.
// impl &__slice[u64] {
//     fn ptr(self) -> raw_ptr {
//         let (ptr, _) = asm(s: self) {
//             s: (raw_ptr, u64)
//         };
//         ptr
//     }
// }

fn main() {
    // Round #1.
    // let s = __slice(&[1, 2, 3], 0, 1);
    // let _ = s.ptr();

    // Round #2.
    // let x = (__addr_of([1u64, 2, 3]), 0u64);
    // let (ptr, _) = asm(s: x) {
    //     s: (raw_ptr, u64)
    // };
    // let _ = ptr;

    // Round #3.
    // let (_, _) = asm(s: (__addr_of([1u64, 2, 3]), 0u64)) {
    //     s: (raw_ptr, u64)
    // };

    // Round #4.
    let (_, _) = asm(s: (0u64, 0u64)) {
        s: (u64, u64)
    };
}