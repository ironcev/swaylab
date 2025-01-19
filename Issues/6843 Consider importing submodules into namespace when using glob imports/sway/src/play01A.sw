library;

use core::*;

struct S { }

impl ops::Eq for S {
//   ^^^ Could not find symbol "ops" in this scope.
    fn eq(self, other: Self) -> bool {
        true
    }
}

#[inline(never)]
pub fn play() {
    let _ = core::storage::StorageKey::<u64>::new(b256::zero(), 0, b256::zero());
    let _ = storage::StorageKey::<u64>::new(b256::zero(), 0, b256::zero());
    //      ^^^^^^^ Module "impl_eq::use_core_star::storage" could not be found.
}
