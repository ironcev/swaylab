library;

enum Enum {
    A: (),
    B: (),
}

fn unwrap() { }

pub fn play() -> () {
    let e = Enum::A;

    let _dummy = match e {
        _ => {
            let tuple = Some((1u8, 1u64, Enum::A));
            let tuple = tuple.unwrap();
            let (x, y, z) = tuple;

            Some((x,y,z))
        }
    };

    let _dummy = match e {
        _ => {
            let tuple = Some((1u8, ));
            let tuple = tuple.unwrap();
            let (x) = tuple;

            if true {
                Some((x, ))
            }
            else {
                None
            }
        }
    };

    poke(Enum::B);
}

fn poke<T>(_x: T) { }
