contract;

use std::storage::{storage_vec::*, storage_map::*};

storage {
    scalar: u64 = 0,
    vec: StorageVec<u64> = StorageVec::<u64> {},
    map: StorageMap<u64, u64> = StorageMap::<u64, u64> {},
}

impl Contract {
    #[storage(read)]
    fn poke_storage_1() {
        poke(storage.scalar);
        poke(storage.vec);
        poke(storage.map);
    }

    #[storage(read)]
    fn poke_storage_2() {
        poke(storage.scalar);
        poke(storage.vec);
        poke(storage.map);
    }

    #[storage(read)]
    fn poke_storage_in_a_loop() {
        let mut i = 0;
        while i < 10 {
            poke(storage.scalar);
            i += 1;
        }
    }
}

#[inline(never)]
fn poke<T>(_t: T) { }