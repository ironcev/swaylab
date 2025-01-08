script;

struct S {
    x: u64,
    y: u64,
}

configurable {
    CONST: S = S { x: 0, y: 0, }, // c0 = config { u64, u64 } { u64 0, u64 0 }, !3
    U64_CONST: u64 = 112233,
}

fn main() {
    configurable_struct();
    configurable_addresses();
    configurable_struct_references();
    configurable_u64_references();
}

#[inline(never)]
fn configurable_struct() {
    let x = get_const();
    let y = get_const();

    poke(x, y);
}

#[inline(always)]
fn get_const() -> S {
    CONST // ret { u64, u64 } c0
}

#[inline(never)]
fn configurable_addresses() {
    let p_s_1 = __addr_of(CONST); // store c0 to v0
    let p_s_2 = __addr_of(CONST); // store c0 to v2

    poke(p_s_1, p_s_2);
}

#[inline(never)]
fn configurable_struct_references() {
    let r_1 = &CONST;
    let r_2 = &CONST;

    poke(r_1, r_2);
}

#[inline(never)]
fn configurable_u64_references() {
    let r_1 = &U64_CONST;
    let r_2 = &U64_CONST;

    poke(r_1, r_2);
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}