contract;

struct SevenU64 {
    a: u64,
    b: u64,
    c: u64,
    d: u64,
    e: u64,
    f: u64,
    g: u64,
}

storage {
    seven_u64: SevenU64 = SevenU64 { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 },
    // same_slot_as_a in 0xeb7ceb95f655d60faa3ae0cd0de1ff1af784e38a3b25a88f2be480f15478907f: u64 = 42,
    // same_slot_as_e in 0xeb7ceb95f655d60faa3ae0cd0de1ff1af784e38a3b25a88f2be480f154789080: u64 = 42,
    n1 {
        seven_u64: SevenU64 = SevenU64 { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 },
        n2 {
            seven_u64: SevenU64 = SevenU64 { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 },
        }

    }
}

// const SEVEN_U64: SevenU64 = SevenU64 { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 };

// configurable {
//     CONFIGURABLE_SEVEN_U64: SevenU64 = SEVEN_U64,
// }

impl Contract {
    fn all_in_one() {
        poke(storage.seven_u64);
        poke(storage.seven_u64.a);
        // poke(storage.seven_u64.b);
        // poke(storage.seven_u64.c);
        // poke(storage.seven_u64.d);
        // poke(storage.seven_u64.e);
        // poke(storage.seven_u64.f);
        // poke(storage.seven_u64.g);

        // poke(storage.same_slot_as_a);
        // poke(storage.same_slot_as_e);

        // poke(SEVEN_U64);
        // poke(CONFIGURABLE_SEVEN_U64);

        poke(storage::n1.seven_u64);
        poke(storage::n1::n2.seven_u64);
    }
}

#[inline(never)]
fn poke<T>(_t: T) { }