pub fn play() {
    let r_1 = &mut get_const();
    let r_2 = &mut get_const();

    *r_1 = 321;

    println!("r_1: {:p}", r_1);
    println!("r_2: {:p}", r_2);

    println!("r_1 value: {}", r_1);
    println!("r_2 value: {}", r_2);
}

#[inline(always)]
fn get_const() -> u64 {
    123
}
