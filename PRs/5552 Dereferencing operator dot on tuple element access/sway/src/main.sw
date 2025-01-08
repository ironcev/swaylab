script;

struct A {
    b: B,
}

struct B {
    t_in_b: (u8, u8, u8),
    t_in_b_one_elem: (u8,),
    not_tuple_in_b: u8,
}

fn main() {
    let mut t = (1, 2, 3);

    let _ = t.5;

    t.4 = 11;

    let mut not_tuple = 0u8;

    let _ = not_tuple.0;

    not_tuple.0 = 11;

    let a = A { b: B { t_in_b: (0, 0, 0), t_in_b_one_elem: (0,), not_tuple_in_b: 0 } };
    let mut array = [a, a];

    let _ = array[0].b.t_in_b.5;

    array[0].b.t_in_b.5 = 11;

    let _ = array[0].b.t_in_b_one_elem.2;

    array[0].b.t_in_b_one_elem.2 = 11;

    array[0].b.not_tuple_in_b.5 = 11;

    let _ = get_tuple(101).5;

    let r_r_r_t = & & &t;

    let _ = r_r_r_t.0;

    let _ = r_r_r_t.5;

    let r_t = &t;

    let _ = r_t.0;

    let _ = r_t.5;
}

fn get_tuple(v: u8) -> (u8, u8) {
    (v, v)
}