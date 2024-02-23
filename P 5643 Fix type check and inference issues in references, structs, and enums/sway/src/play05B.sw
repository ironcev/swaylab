library;

use std::option::Option as OptionAlias;

pub fn play() {
    let o: Option<u8> = Option::Some(123u64);
    match o {
        Some(x) => x == 123u8,
        _ => false,
    };

    // let o: OptionAlias<u8> = Option::Some(123u64);
    // match o {
    //     Some(x) => x == 123u8,
    //     _ => false,
    // };

    // let o: Option<u8> = OptionAlias::Some(123u64);
    // match o {
    //     Some(x) => x == 123u8,
    //     _ => false,
    // };
}