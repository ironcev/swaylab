library;

pub fn play() {
    poke(asm() { });
    poke(asm() { zero });
    poke(asm() { zero: () });

    let arg = 11u64;
    asm(a: arg, b: arg, res) {
        add res a b;
    };

    asm(a: arg, b: arg, res) {
        add res a b;
        res
    };

    // -----------

    asm () { }
    asm () { zero }
    asm() { zero: () }

    asm(arg: arg) {  };
    asm(arg: arg) { arg };

    let a = asm() { };
    let b = asm() { zero };
    let c = asm(arg: arg) { };
    let d = asm(arg: arg) { arg };
    let e = asm(arg: arg) { arg: u32 };

    let f = asm(arg: function()) { arg };
}

#[inline(never)]
fn function() -> u64 {
    0
}

#[inline(never)]
fn poke<T>(_x: T) { }
