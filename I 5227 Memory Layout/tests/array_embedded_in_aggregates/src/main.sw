script;

struct A {
    a_1: [u8; 3],
    a_2: [u8; 3],
}

fn main() -> bool {
    let a = A {
        a_1: [1_11, 1_22, 1_33],
        a_2: [2_11, 2_22, 2_33],
    };
    
    assert(a.a_1[0] == 1_11);
    assert(a.a_1[1] == 1_22);
    assert(a.a_1[2] == 1_33);

    assert(a.a_2[0] == 2_11);
    assert(a.a_2[1] == 2_22);
    assert(a.a_2[2] == 2_33);

    true
}
