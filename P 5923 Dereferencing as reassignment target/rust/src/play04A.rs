struct A<'a> {
    r_a: &'a mut u8,
}

struct S<'a> {
    r_r_x: &'a mut &'a mut A<'a>,
    r_array: &'a mut [&'a mut u8;2],
}

pub fn play() {
    let mut x = 0u8;
    let mut array = [&mut 0u8, &mut 0u8];
    let mut a = A { r_a: &mut x };
    let s = S { r_r_x: &mut &mut a, r_array: &mut array };

    *s.r_r_x.r_a = 1;
    *s.r_array[0] = 1;
}
