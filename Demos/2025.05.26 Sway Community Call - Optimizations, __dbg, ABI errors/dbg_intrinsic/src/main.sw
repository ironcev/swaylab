contract;

mod point;

use point::Point;

struct Struct {
    value: u64,
    txt: str,
}

abi DbgDemo {
    fn dbg_demo(input: u64) -> bool;
}

impl DbgDemo for Contract {
    fn dbg_demo(input: u64) -> bool {
        __dbg("dbg_demo called");

        let result = __dbg(input) == 42;

        __dbg(input * 2);

        __dbg(Struct {
            value: input * 2,
            txt: "Hello, __dbg!",
        });

        let s = Struct {
            value: input * 3,
            txt: "This is some text.",
        };

        __dbg(s);

        let mut vec = Vec::new();
        vec.push(1);
        vec.push(2);
        vec.push(3);
        vec.push(4);

        __dbg(vec);

        let mut vec = Vec::new();
        vec.push(Struct {
            value: input * 1,
            txt: "First struct.",
        });
        vec.push(Struct {
            value: input * 2,
            txt: "Second struct.",
        });
        vec.push(Struct {
            value: input * 3,
            txt: "Third struct.",
        });
        __dbg(vec);

        let ptr = __addr_of(s);
        __dbg(ptr);

        __dbg(Point {
            x: 11,
            y: 22,
        });

        __dbg(result)
    }
}

#[test]
fn test_dbg_demo() {
    let caller = abi(DbgDemo, CONTRACT_ID);
    assert_eq(caller.dbg_demo(42), true);
}
