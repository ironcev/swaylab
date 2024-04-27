pub fn play() {
    let r_1 = &get_const();
    let r_2 = &get_const();

    println!("r_1: {:p}", r_1);
    println!("r_2: {:p}", r_2);

    println!("reference #1: {:p}", &get_const());
    println!("reference #2: {:p}", &get_const());

    println!("mut reference #1: {:p}", &mut get_const());
    println!("mut reference #2: {:p}", &mut get_const());
}

#[inline(always)]
fn get_const() -> u64 {
    123
}

// Running `target/debug/plays`
// r_1: 0x7ffc08f870b0
// r_2: 0x7ffc08f870c0
// reference #1: 0x7ffc08f87190
// reference #2: 0x7ffc08f871e0
// mut reference #1: 0x7ffc08f87230
// mut reference #2: 0x7ffc08f87280

// Running `target/release/plays`
// r_1: 0x7ffff8879658
// r_2: 0x7ffff8879668
// reference #1: 0x7ffff8879648
// reference #2: 0x7ffff8879648
// mut reference #1: 0x7ffff8879648
// mut reference #2: 0x7ffff8879648
