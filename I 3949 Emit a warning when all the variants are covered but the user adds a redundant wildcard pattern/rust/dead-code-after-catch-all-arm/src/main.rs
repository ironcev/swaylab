fn main() {
    let x = (1, 2, 3, 4, 5);

    let _y = match x {
        (1, 2, 3, 4, 5) => 0,
        _ => 0,
        (11, 22, 33, 44, 55) => 0,
        (_, 22, _, 44, _) => 0,
        (_, _, _, _, _) => 0,
    };

    if false {
        print!("This is some very dead code.");
    }
}
