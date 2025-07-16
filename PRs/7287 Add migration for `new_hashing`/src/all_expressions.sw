library;

use std::hash::sha256;

enum E {
    A: b256,
}

struct S {
    x: u64,
}

trait Trait {
} {
    fn trait_fn() {
        let _ = sha256("affected in trait fn");
        let _ = { sha256("affected in trait fn"); 1 } + 1;
    }

    fn trait_method(self) {
        let _ = sha256("affected in trait method");
        let _ = { sha256("affected in trait method"); 1 } + 1;
    }
}

abi Abi {
    #[payable]
    fn some_method_without_args() -> u64;
    #[payable]
    fn some_method_with_args(a: b256, b: b256) -> u64;
} {
    fn abi_fn() {
        let _ = sha256("affected in abi fn");
        let _ = { sha256("affected in abi fn"); 1 } + 1;
    }
}

fn get_mut_mut_ref(_b: b256, r_r_x: &mut &mut u64) -> &mut &mut u64 {
    r_r_x
}

pub fn play() -> u64 {
    let _ = { sha256("affected in add"); 1 } + 1;
    let _ = { E::A(sha256("affected in subtract")); 1 } - 1;
    let _ = __addr_of(sha256("affected in _addr_of intrinsic"));
    let _ = { __addr_of(sha256("affected in _addr_of intrinsic in add")); 1 } + 1;
    let _ = __log(sha256("affected in __log intrinsic"));
    let _ = { __log(sha256("affected in __log intrinsic in add")); 1 } + 1;
    let _ = __log(());

    let _ = (E::A(sha256("affected in tuple")), );
    let _ = (E::A(sha256("affected in tuple")), sha256([1, 2, 3]));
    let _ = (E::A(sha256("affected in tuple")), sha256(111), sha256([1, 2, 3]));
    let _ = (sha256(111), E::A(sha256("affected in tuple")), sha256(111), sha256([1, 2, 3]));
    let _ = { (E::A(sha256("affected in tuple in add")), ); 1 } + 1;

    let _ = [E::A(sha256("affected in sequence array"))];
    let _ = [E::A(sha256("affected in sequence array")), E::A(sha256([1, 2, 3]))];
    let _ = [sha256("affected in sequence array"), sha256(111), sha256([1, 2, 3])];
    let _ = [sha256(111), sha256("affected in sequence array"), sha256(111), sha256([1, 2, 3])];
    let _ = { [E::A(sha256("affected in sequence array in add"))]; 1 } + 1;

    let _ = [E::A(sha256("affected in repeat array")); 42];
    let _ = { [E::A(sha256("affected in repeat array in add")); 42]; 1 } + 1;

    let _ = asm(r1: E::A(sha256("affected in asm init"))) {
        r1: u64
    };
    let _ = asm(r1: E::A(sha256("affected in asm init")), r2: sha256([1, 2, 3])) {
        r1: u64
    };
    let _ = asm(r1: E::A(sha256("affected in asm init")), r2: sha256(111), r3: sha256([1, 2, 3])) {
        r1: u64
    };

    let _ = { asm(r1: E::A(sha256("affected in asm init in add"))) { r1: u64 }; 1 } + 1;

    if get_bool(sha256("affected in if condition")) {
        panic {
            let _ = sha256("affected in panic");
            let _ = { sha256("affected in panic in add"); 1 } + 1;
            "This is a panic"
        };
    } else if get_bool(sha256("affected in else if condition")) {
        panic ();
    } else {
        panic;
    }

    // BUG: Unexpected token in statement.
    // if let S { x } = S { x: get_u64(sha256("affected in if let")) } {
    // } else if let S { x } = S { x: get_u64(sha256("affected in else if let")) } {
    // } else {
    // }
    if let S { x } = get_s(sha256("affected in if let")) {
    } else if let S { x } = get_s(sha256("affected in else if let")) {
    } else {
    }

    let _ = match sha256("affected in match value") {
        _ => {
            let _ = { sha256("affected in match arm block in add"); 1 } + 1;
            sha256("affected in match arm block")
        }
        _ => sha256("affected in match arm expression"),
    };

    for _elem in get_vec_iter(sha256("affected in for iterator")) {
        let _ = sha256("affected in for loop");
        let _ = { sha256("affected in for loop in add"); 1 } + 1;
    }

    for _elem in get_vec(sha256("affected in for iterator")).iter() {
        let _ = sha256("affected in for loop");
        let _ = { sha256("affected in for loop in add"); 1 } + 1;
    }

    let _ = get_s(sha256("affected in struct field access target")).x;
    let _: u256 = sha256("affected in method target").into();

    let _ = S { x: get_u64(sha256("affected in struct field initialization")) };

    let _ = &sha256("affected in referencing");
    let _ = &mut sha256("affected in mut referencing");
    let _ = &mut & &mut sha256("affected in multiple referencing");

    let _ = * &sha256("affected in dereferencing");
    let _ = * &mut sha256("affected in mut dereferencing");
    let _ = * * * &mut & &mut sha256("affected in multiple dereferencing");

    let caller = abi(Abi, sha256("affected in abi"));
    let _ = caller.some_method_without_args();
    let _ = caller.some_method_without_args
    {
        gas: get_u64(sha256("affected in contract call gas")),
    }
    ();
    let _ = caller.some_method_without_args
    {
        gas: get_u64(sha256("affected in contract call gas")),
        coins: get_u64(sha256("affected in contract call coins")),
    }
    ();
    let _ = caller.some_method_without_args
    {
        gas: get_u64(sha256("affected in contract call gas")),
        coins: get_u64(sha256("affected in contract call coins")),
        asset_id: sha256("affected in contract call asset_id"),
    }
    ();
    let _ = caller.some_method_with_args
    {
        gas: get_u64(sha256("affected in contract call gas")),
        coins: get_u64(sha256("affected in contract call coins")),
        asset_id: sha256("affected in contract call asset_id"),
    }
    (sha256("affected in contract call arg 1"), sha256("affected in contract call arg 2"));

    let mut array = [1, 2, 3];
    array[get_u64(sha256("affected in array index reassignment"))] = 42;

    let mut array = [[1, 2, 3], [4, 5, 6]];
    array[get_u64(sha256("affected in array index reassignment 1"))][get_u64(sha256("affected in array index reassignment 2"))] = 42;

    let mut tuple = ([[1, 2, 3], [4, 5, 6]], 42);
    tuple.0[get_u64(sha256("affected in tuple index reassignment 1"))][get_u64(sha256("affected in tuple index reassignment 2"))] = 42;

    **get_mut_mut_ref(sha256("affected in mut mut ref reassignment"), &mut &mut 0) = 42;

    42
}

fn get_bool(_b: b256) -> bool {
    true
}

fn get_u64(_b: b256) -> u64 {
    42
}

fn get_vec(_b: b256) -> Vec<u8> {
    Vec::<u8>::new()
}

fn get_vec_iter(_b: b256) -> VecIter<u8> {
    Vec::<u8>::new().iter()
}

fn get_s(_b: b256) -> S {
    S { x: 42 }
}
