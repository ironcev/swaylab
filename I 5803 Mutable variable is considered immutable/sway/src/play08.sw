library;

pub fn play() {
    let _ = core;
    let _ = core::;
    let _ = core::ops;
    let _ = core::
                ops;

    f(core);
    f(core::);
    f(core::ops);
    f(core::
        ops);

    core = 0;
    core:: = 0;
    core::ops = 0;
    core::
        ops = 0;
    



    f(core::ops);
}

fn f(_x: u8) { }
