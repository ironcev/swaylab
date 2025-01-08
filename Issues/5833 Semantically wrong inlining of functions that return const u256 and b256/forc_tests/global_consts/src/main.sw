script;

struct S {
    x: u64,
    b: bool,
}

enum E {
    A: (),
    B: bool,
    C: S,
}

const CONST_S_1: S = S { x: 1111, b: true };
const CONST_S_2: S = S { x: 2222, b: false };

const CONST_E_A: E = E::A;
const CONST_E_B_1: E = E::B(true);
const CONST_E_B_2: E = E::B(false);
const CONST_E_C_1: E = E::C(CONST_S_1);
const CONST_E_C_2: E = E::C(CONST_S_2);

const CONST_U64_ZERO: u64 = 0; 
const CONST_U64_ONE: u64 = 1; 
const CONST_U64_BIG: u64 = 112233; 

const CONST_ARRAY_U64_SMALL: [u64;5] = [11, 22, 33, 44, 55]; 
const CONST_ARRAY_U64_BIG: [u64;1000] = [7788;1000]; 

#[test]
fn test() {
    copy_to_local_1();
    copy_to_local_2();
}

#[inline(never)]
fn copy_to_local_1() {
    let s_1 = CONST_S_1; 
    
    poke(s_1, 0, 0, 0, 0, 0);
}

#[inline(never)]
fn copy_to_local_2() {
    let s_1 = CONST_S_1; 
    
    poke(s_1, 1, 1, 1, 1, 1);
}

fn main() {}

#[inline(never)]
fn poke<A, B, C, D, E, F>(_a: A, _b: B, _c: C, _d: D, _e: E, _f: F) {}