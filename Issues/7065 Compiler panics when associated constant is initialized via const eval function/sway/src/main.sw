library;

struct S {}

fn eval_s_c(val: u8) -> u8 {
    val
}

impl S {
    const S_C: u8 = eval_s_c(111);
}

// const S_C: u8 = eval_s_c(111);
