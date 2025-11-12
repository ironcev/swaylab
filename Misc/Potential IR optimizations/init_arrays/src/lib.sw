library;

struct S1 {
    a: u64,
}

struct S2 {
    a: u64,
    b: u64,
}

#[inline(never)]
fn poke<T>(_t: T) {}

#[test]
fn bench_baseline() {
    poke(());
}

#[test]
fn bench_init_array_of_five_zeros() {
    poke([0u64, 0, 0, 0, 0]);
}

#[test]
fn bench_init_array_of_more_than_five_zeros() {
    poke([0u64, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
}

#[test]
fn bench_init_array_of_five_repeated_zeroed_s1() {
    poke([S1 { a: 0 }; 5]);
}

#[test]
fn bench_init_array_of_ten_repeated_zeroed_s1() {
    poke([S1 { a: 0 }; 10]);
}

#[test]
fn bench_init_array_of_five_repeated_zeroed_s2() {
    poke([S2 { a: 0, b: 0 }; 5]);
}

#[test]
fn bench_init_array_of_ten_repeated_zeroed_s2() {
    poke([S2 { a: 0, b: 0 }; 10]);
}

#[test]
fn bench_init_array_of_five_repeated_zeroed_s2_with_sroa_on_array_element() {
    poke([S2 { a: 0, b: 0 }; 5][0]);
}

#[test]
fn bench_init_array_of_five_repeated_zeroed_s2_with_sroa_on_s2_b() {
    poke([S2 { a: 0, b: 0 }; 5][0].b);
}
