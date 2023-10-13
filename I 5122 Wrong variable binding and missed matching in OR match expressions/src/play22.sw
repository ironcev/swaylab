library;

fn unwrap() { }

pub fn play() -> () {
    let e = 0u64;

    let _dummy = match e {
        _ => {
            let tuple = Some((1u8, 1u64, 1u32));
            let tuple = tuple.unwrap();
            let (x, y, z) = tuple;
            
            __revert(12345);

            Some((x,y,z))
        }
    };

    let _dummy = match e {
        _ => {
            let x = if 1 == 1 {
                1
            }
            else if 2 == 2 {
                2
            }
            else {
                __revert(54321)
            };

            x
        }
    };
}
