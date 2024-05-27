script;

struct S {
    x: u64,
    y: u64,
}

fn main() {
    ret_s_1();
    ret_s_2();
}

#[inline(never)]
fn ret_s_1() -> S {
    S {
        x: 11,
        y: 11,
    }
}

#[inline(never)]
fn ret_s_2() -> S {
    S {
        x: 22,
        y: 22,
    }
}

// fn my_fn(__ret_value: u64) { }
//       ^^^^^^^^^^^ Identifiers cannot begin with a double underscore, as that naming convention is reserved for compiler intrinsics.