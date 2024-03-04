library;

pub fn play() {
    let mut x = 123;
    let mut y = 123;

    let r_mut_x = &mut x;

    let r_x: &u8 = r_mut_x;

    let mut mut_r_mut = r_mut_x;
    mut_r_mut = &mut y;

    let r_mut = r_mut_x;
    r_mut = &mut y;

    let _: &u8 = r_mut_x;
    let _: &mut u8 = r_mut_x;
    let _: &mut u8 = &x;

    let _: &mut &mut &mut u8 = &mut &mut x;

    let _: &mut &mut u8 = &mut &mut &mut x;
}
