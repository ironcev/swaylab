library;

pub fn play() {
    asm () { }

    asm () { zero }

    asm() { zero: () }

    let arg_u8 = 11u8;
    asm(arg: arg_u8) {  };
    asm(arg: arg_u8) { arg };

    let _ = asm(arg: arg_u8) { arg };

    let _ = asm(arg: function()) { arg };

    poke(asm() { }); // ERROR: Internal compiler error: An attempt to get register for unknown Value.

    poke(asm(a: arg_u8, b: arg_u8, res) {
        add res a b;
        res: u8
    });

    poke(asm(a: arg_u8, b: arg_u8, res) {
        add res a b;
        res
    });

    poke(asm(a: arg_u8, b: arg_u8, res) { // ERROR: Internal compiler error: An attempt to get register for unknown Value.
        add res a b;
    });

    poke(asm() { zero: () });

    ()
}

#[inline(never)]
fn function() -> u64 {
    0
}

#[inline(never)]
fn poke<T>(_x: T) { }
