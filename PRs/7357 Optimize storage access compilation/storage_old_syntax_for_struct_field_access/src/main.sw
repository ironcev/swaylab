contract;

struct A {
    field_u64: u64,
    field_tuple: (u8, u64),
}

struct B {
    field_a_1: A,
    field_a_2: A,
}

struct SlotSize {
    slot_field: u256,
}

struct DoubleSlotSize {
    slot_field_1: SlotSize,
    slot_field_2: SlotSize,
}

struct FourU64 {
    a: u64,
    b: u64,
    c: u64,
    d: u64,
}

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
    b: B = B {
        field_a_1: A {
            field_u64: 1111,
            field_tuple: (22, 2222)
        },
        field_a_2: A {
            field_u64: 3333,
            field_tuple: (44, 4444)
        },
    },
    double_slot: DoubleSlotSize = DoubleSlotSize {
        slot_field_1: SlotSize { slot_field: 0x1111u256 },
        slot_field_2: SlotSize { slot_field: 0x2222u256 },
    },
    four_u64: FourU64 = FourU64 {
        a: 11,
        b: 22,
        c: 33,
        d: 44,
    },
    seven_u64: SevenU64 = SevenU64 {
        a: 11,
        b: 22,
        c: 33,
        d: 44,
        e: 55,
        f: 66,
        g: 77,
    },
}

impl Contract {
    #[storage(read)]
    fn old_syntax_b_field_a_1_field_u64() -> u64 {
        // let _ = storage.b.field_a_1.field_u64.x;

        // storage.b.field_a_1.field_u64

        storage.b.field_a_1.field_u64.read()
        // read(storage.b.field_a_1.field_u64)

        // storage.b.field_a_1.field_tuple.1
    }

    #[storage(read)]
    fn new_syntax_b_field_a_1_field_u64() -> u64 {
        storage.b.read().field_a_1.field_u64
        // read(storage.b).field_a_1.field_u64
    }

    #[storage(read)]
    fn old_syntax_b_field_a_1_field_u64_multiple_reads() -> (u64, u64) {
        (
            storage.b.field_a_1.field_u64.read(),
            storage.b.field_a_1.field_u64.read(),
        )
    }

    #[storage(read)]
    fn new_syntax_b_field_a_1_field_u64_multiple_reads() -> (u64, u64) {
        (
            storage.b.read().field_a_1.field_u64,
            storage.b.read().field_a_1.field_u64,
        )
    }

    #[storage(read)]
    fn old_syntax_double_slot_slot_field_2() -> u256 {
        storage.double_slot.slot_field_2.slot_field.read()
    }

    #[storage(read)]
    fn new_syntax_double_slot_slot_field_2() -> u256 {
        storage.double_slot.read().slot_field_2.slot_field
    }

    #[storage(read)]
    fn old_syntax_four_u64_b() -> u64 {
        storage.four_u64.b.read()
    }

    #[storage(read)]
    fn new_syntax_four_u64_b() -> u64 {
        storage.four_u64.read().b
    }

    #[storage(read)]
    fn old_syntax_seven_u64_g() -> u64 {
        storage.seven_u64.g.read()
    }

    #[storage(read)]
    fn new_syntax_seven_u64_g() -> u64 {
        storage.seven_u64.read().g
    }
}

fn poke<T>(_t: T) { }

#[storage(read)]
#[inline(never)]
fn read<T>(sk: StorageKey<T>) -> T {
    sk.read()
}

// New encoding:
//   test old_syntax_b_field_a_1_field_u64 ... ok (121.459µs, 2411 gas)
//   test new_syntax_b_field_a_1_field_u64 ... ok (121.62µs, 1799 gas)
//   test old_syntax_b_field_a_1_field_u64_multiple_reads ... ok (114.489µs, 2918 gas)
//   test new_syntax_b_field_a_1_field_u64_multiple_reads ... ok (124.6µs, 2336 gas)
//   test old_syntax_double_slot_slot_field_2 ... ok (149.395µs, 2741 gas)
//   test new_syntax_double_slot_slot_field_2 ... ok (100.608µs, 2083 gas)
//   test old_syntax_four_u64_b ... ok (131.378µs, 2741 gas)
//   test new_syntax_four_u64_b ... ok (112.373µs, 2138 gas)
//   test old_syntax_seven_u64_g ... ok (155.045µs, 2852 gas)
//   test new_syntax_seven_u64_g ... ok (118.678µs, 2229 gas)

// Old encoding:
//   test old_syntax_b_field_a_1_field_u64 ... ok (60.807µs, 506 gas)
//   test new_syntax_b_field_a_1_field_u64 ... ok (52.792µs, 522 gas)
//   test old_syntax_b_field_a_1_field_u64_multiple_reads ... ok (63.653µs, 836 gas)
//   test new_syntax_b_field_a_1_field_u64_multiple_reads ... ok (75.863µs, 881 gas)
//   test old_syntax_double_slot_slot_field_2 ... ok (70.78µs, 610 gas)
//   test new_syntax_double_slot_slot_field_2 ... ok (80.89µs, 564 gas)
//   test old_syntax_four_u64_b ... ok (44.135µs, 515 gas)
//   test new_syntax_four_u64_b ... ok (54.15µs, 530 gas)
//   test old_syntax_seven_u64_g ... ok (44.746µs, 519 gas)
//   test new_syntax_seven_u64_g ... ok (66.078µs, 502 gas)

#[test]
fn old_syntax_b_field_a_1_field_u64() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.old_syntax_b_field_a_1_field_u64();
    assert_eq(result, 1111);
}

#[test]
fn new_syntax_b_field_a_1_field_u64() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.new_syntax_b_field_a_1_field_u64();
    assert_eq(result, 1111);
}

#[test]
fn old_syntax_b_field_a_1_field_u64_multiple_reads() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.old_syntax_b_field_a_1_field_u64_multiple_reads();
    assert_eq(result, (1111, 1111));
}

#[test]
fn new_syntax_b_field_a_1_field_u64_multiple_reads() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.new_syntax_b_field_a_1_field_u64_multiple_reads();
    assert_eq(result, (1111, 1111));
}

#[test]
fn old_syntax_double_slot_slot_field_2() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.old_syntax_double_slot_slot_field_2();
    assert_eq(result, 0x2222u256);
}

#[test]
fn new_syntax_double_slot_slot_field_2() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.new_syntax_double_slot_slot_field_2();
    assert_eq(result, 0x2222u256);
}

#[test]
fn old_syntax_four_u64_b() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.old_syntax_four_u64_b();
    assert_eq(result, 22);
}

#[test]
fn new_syntax_four_u64_b() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.new_syntax_four_u64_b();
    assert_eq(result, 22);
}

#[test]
fn old_syntax_seven_u64_g() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.old_syntax_seven_u64_g();
    assert_eq(result, 77);
}

#[test]
fn new_syntax_seven_u64_g() {
    let caller = abi(StorageOldSyntaxAbi, CONTRACT_ID);
    let result = caller.new_syntax_seven_u64_g();
    assert_eq(result, 77);
}
