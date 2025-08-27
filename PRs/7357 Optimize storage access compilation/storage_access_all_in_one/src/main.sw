contract;

struct A {
    f_u64: u64,
}

struct B {
    f_a: A,
}

struct C {
    f_b: B,
}

use std::storage::{storage_vec::*, storage_map::*};

storage {
    c: C = C { f_b: B { f_a: A { f_u64: 0 } } },
    ns1 {
        c: C = C { f_b: B { f_a: A { f_u64: 0 } } },
        ns2 {
            c: C = C { f_b: B { f_a: A { f_u64: 0 } } },
        }
    }
}

impl Contract {
    #[storage(read)]
    fn all_in_one() {
        poke(storage.c);
        poke(storage.c.f_b);
        poke(storage.c.f_b.f_a);
        poke(storage.c.f_b.f_a.f_u64);
        poke(storage::ns1.c);
        poke(storage::ns1.c.f_b);
        poke(storage::ns1.c.f_b.f_a);
        poke(storage::ns1.c.f_b.f_a.f_u64);
        poke(storage::ns1::ns2.c);
        poke(storage::ns1::ns2.c.f_b);
        poke(storage::ns1::ns2.c.f_b.f_a);
        poke(storage::ns1::ns2.c.f_b.f_a.f_u64);
    }

    fn path_reused() {
        poke(storage.c);
        poke(storage.c.f_b);
        poke(storage.c.f_b.f_a);
        poke(storage.c.f_b.f_a.f_u64);
        poke(storage::ns1.c);
        poke(storage::ns1.c.f_b);
        poke(storage::ns1.c.f_b.f_a);
        poke(storage::ns1.c.f_b.f_a.f_u64);
        poke(storage::ns1::ns2.c);
        poke(storage::ns1::ns2.c.f_b);
        poke(storage::ns1::ns2.c.f_b.f_a);
        poke(storage::ns1::ns2.c.f_b.f_a.f_u64);

        poke(storage.c);
        poke(storage.c.f_b);
        poke(storage.c.f_b.f_a);
        poke(storage.c.f_b.f_a.f_u64);
        poke(storage::ns1.c);
        poke(storage::ns1.c.f_b);
        poke(storage::ns1.c.f_b.f_a);
        poke(storage::ns1.c.f_b.f_a.f_u64);
        poke(storage::ns1::ns2.c);
        poke(storage::ns1::ns2.c.f_b);
        poke(storage::ns1::ns2.c.f_b.f_a);
        poke(storage::ns1::ns2.c.f_b.f_a.f_u64);
    }
}

#[inline(never)]
fn poke<T>(_t: T) { }