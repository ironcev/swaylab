script;

struct S {
    x: u64,
    y: b256,
    z: bool,
}

fn main() { }

// Bytecode size: 600.
#[inline(never)]
fn slot_calculator_original<T>(slot: b256, offset: u64) -> (b256, u64, u64) {
    let size_of_t = __size_of::<T>();

    // Get the last storage slot needed based on the size of `T`.
    // ((offset * bytes_in_word) + bytes + (bytes_in_slot - 1)) >> align_to_slot = last slot
    let last_slot = ((offset * 8) + size_of_t + 31) >> 5;

    // Where in the storage slot to align `T` in order to pack word-aligned.
    // offset % number_words_in_slot = word_place_in_slot
    let place_in_slot = offset % 4;

    // Get the number of slots `T` spans based on its packed position.
    // ((place_in_slot * bytes_in_word) + bytes + (bytes_in_slot - 1)) >> align_to_slot = number_of_slots
    let number_of_slots = match __is_reference_type::<T>() {
        true => ((place_in_slot * 8) + size_of_t + 31) >> 5,
        false => 1,
    };

    // Determine which starting slot `T` will be stored based on the offset.
    let mut offset_slot = slot.as_u256();
    offset_slot += last_slot.as_u256() - number_of_slots.as_u256();
    (offset_slot.as_b256(), number_of_slots, place_in_slot)
}

// Bytecode size: 488.
#[inline(never)]
fn slot_calculator_transmute<T>(slot: b256, offset: u64) -> (b256, u64, u64) {
    let size_of_t = __size_of::<T>();

    // Get the last storage slot needed based on the size of `T`.
    // ((offset * bytes_in_word) + bytes + (bytes_in_slot - 1)) >> align_to_slot = last slot
    let last_slot = ((offset * 8) + size_of_t + 31) >> 5;

    // Where in the storage slot to align `T` in order to pack word-aligned.
    // offset % number_words_in_slot = word_place_in_slot
    let place_in_slot = offset % 4;

    // Get the number of slots `T` spans based on its packed position.
    // ((place_in_slot * bytes_in_word) + bytes + (bytes_in_slot - 1)) >> align_to_slot = number_of_slots
    let number_of_slots = if __is_reference_type::<T>() {
        ((place_in_slot * 8) + size_of_t + 31) >> 5
    } else {
        1
    };

    // Determine which starting slot `T` will be stored based on the offset.
    let mut offset_slot = slot.as_u256();
    offset_slot += (last_slot - number_of_slots).as_u256();
    (__transmute::<u256, b256>(offset_slot), number_of_slots, place_in_slot)
}

// Bytecode size: 432.
#[inline(never)]
fn slot_calculator_transmute_with_custom_add<T>(slot: b256, offset: u64) -> (b256, u64, u64) {
    let size_of_t = __size_of::<T>();

    // Get the last storage slot needed based on the size of `T`.
    // ((offset * bytes_in_word) + bytes + (bytes_in_slot - 1)) >> align_to_slot = last slot
    let last_slot = ((offset * 8) + size_of_t + 31) >> 5;

    // Where in the storage slot to align `T` in order to pack word-aligned.
    // offset % number_words_in_slot = word_place_in_slot
    let place_in_slot = offset % 4;

    // Get the number of slots `T` spans based on its packed position.
    // ((place_in_slot * bytes_in_word) + bytes + (bytes_in_slot - 1)) >> align_to_slot = number_of_slots
    let number_of_slots = if __is_reference_type::<T>() {
        ((place_in_slot * 8) + size_of_t + 31) >> 5
    } else {
        1
    };

    // Determine which starting slot `T` will be stored based on the offset.
    let mut offset_slot = slot.as_u256();
    add_u64_to_u256(offset_slot, last_slot - number_of_slots);
    (__transmute::<u256, b256>(offset_slot), number_of_slots, place_in_slot)
}

#[inline(always)]
fn add_u64_to_u256(ref mut num: u256, val: u64) {
    asm(num: num, val: val) {
        wqop num num val i0;
    }
}

#[test]
fn test_add_u64_to_u256() {
    let mut a = u256::from(100u64);
    add_u64_to_u256(a, 0);
    assert_eq(a, u256::from(100u64));
    add_u64_to_u256(a, 42);
    assert_eq(a, u256::from(100u64) + u256::from(42u64));
    add_u64_to_u256(a, u64::max());
    assert_eq(a, u256::from(100u64) + u256::from(42u64) + u256::from(u64::max()));
    add_u64_to_u256(a, u64::max());
    assert_eq(a, u256::from(100u64) + u256::from(42u64) + u256::from(u64::max()) + u256::from(u64::max()));
    add_u64_to_u256(a, 111);
    assert_eq(a, u256::from(100u64) + u256::from(42u64) + u256::from(u64::max()) + u256::from(u64::max()) + u256::from(111u64));
}

#[inline(never)]
fn ping<T>(_t: T) { }

#[test]
fn bench_baseline() {
    let base_slot = b256::from(42);
    let offset = 3;
    ping((base_slot, offset));
}

#[test]
fn bench_slot_calculator_original() {
    let base_slot = b256::from(42);
    let offset = 3;
    ping((base_slot, offset));

    let _ = slot_calculator_original::<S>(base_slot, offset);
}

#[test]
fn bench_slot_calculator_transmute() {
    let base_slot = b256::from(42);
    let offset = 3;
    ping((base_slot, offset));

    let _ = slot_calculator_transmute::<S>(base_slot, offset);
}

#[test]
fn bench_slot_calculator_transmute_with_custom_add() {
    let base_slot = b256::from(42);
    let offset = 3;
    ping((base_slot, offset));

    let _ = slot_calculator_transmute_with_custom_add::<S>(base_slot, offset);
}