library;

struct S {
    x: u64,
    y: u64,
    z: u64,
}

pub fn play() -> () {
    let e = 0;

    match e {
        0 => {
            let _s = S { x: 0, y: 0, z: 0 };
            let S { x: a, y: b, z: _ } = S { x: 0, y: 0, z: 0 };
            let S { x, .. } = S { x: 0, y: 0, z: 0 };
        },
        _ => (),
    };

    // let _s: S = S { x: 0, y: 0, z: 0 };

    // let __destructure_1: S = S { x: 0, y: 0, z: 0 };
    // let a: u64 = __destructure_1.x;
    // let b: u64 = __destructure_1.y;
    // let _: u64 = __destructure_1.z;

    // let __destructure_2: S = S { x: 0, y: 0, z: 0 };
    // let x: u64 = __destructure_2.x;
}
