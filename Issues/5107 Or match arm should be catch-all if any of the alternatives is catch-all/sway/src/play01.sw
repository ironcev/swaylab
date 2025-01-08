library;

enum EnumA {
    A: (u64),
    B: (u64),
}

enum EnumB {
    A: (),
    B: (),
}

pub fn play() -> () {
    let n = 1;
 
    let _x = match n {
        1 | 2 | _ => 0,
        3 => 1,
        4 => 2,
    };

    let or1 = true;

    let _x = match or1 {
        true => 0,
        false => 0,
        true | false | _ => 0, // BUG!! The arm is considered reachable.
    };

    let or1 = true;

    let _x = match or1 {
        true => 0,
        false => 0,
        _ | true | false => 0, // BUG!! The arm is considered reachable.
    };

    let or2 = true;

    let _x = match or2 {
        true | false | _ => 0,
        true => 0,
        false => 0,
    };

    let or3 = true;

    let _x = match or3 {
        true => 0,
        false => 0,
        _ => 0,
    };

    let or3 = true;

    let _x = match or3 {
        true => 0,
        false => 0,
        x => if x { 0 } else { 1 },
    };

    let or3 = true;

    let _x = match or3 {
        true => 0,
        false => 0,
        true => 0,
    };

    let or3 = true;

    let _x = match or3 {
        true => 0,
        false => 0,
        true | false => 0, // BUG!! The arm is considered reachable.
    };

    let or3 = true;

    let _x = match or3 {
        true => 0,
        false => 0,
        true | _ => 0, // BUG!! The arm is considered reachable.
    };

    // Generates internal compiler error: https://github.com/FuelLabs/sway/issues/5106
    // let e = EnumB::A;
 
    // let _x = match e {
    //     EnumB::A | EnumB::B | _ => 0,
    //     EnumB::A => 0,
    //     EnumB::B => 0,
    // };

    // let e = Enum::A(0);
 
    // let _x = match e {
    //     Enum::A(x) | Enum::B(x) | _ => 0,
    //     Enum::A(x) => x,
    //     Enum::B(x) => x,
    // };

    // let e = Enum::A(0);
 
    // let _x = match e {
    //     Enum::A(_) | Enum::B(_) | _ => 0,
    //     Enum::A(_) => 0,
    //     Enum::B(_) => 0,
    // };

    poke(EnumA::A(0));
    poke(EnumA::B(0));
    poke(EnumB::A);
    poke(EnumB::B);
}

fn poke<T>(_x: T) { }
