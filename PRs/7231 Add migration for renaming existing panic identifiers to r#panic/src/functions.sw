library;

struct S { }

impl S {
    fn panic(self) -> u64 {
        0
    }

    fn method_with_only_panic_arg(self, panic: u64) -> u64 {
        panic
    }

    fn method_with_first_panic_arg(self, panic: u64, x: u64) -> u64 {
        panic + x
    }

    fn method_with_middle_panic_arg(self, x: u64, panic: u64, y: u64) -> u64 {
        y + panic + x
    }

    fn method_with_last_panic_arg(self, x: u64, y: u64, panic: u64) -> u64 {
        y + panic + x
    }
}

enum E {
    A: (),
}

impl E {
    fn panic() -> u64 {
        0
    }
}

pub fn panic() -> u64 {
    0
}

fn not_panic() -> u64 {
    1
}

fn fn_with_only_panic_arg(panic: u64) -> u64 {
    panic
}

fn fn_with_first_panic_arg(panic: u64, x: u64) -> u64 {
    panic + x
}

fn fn_with_middle_panic_arg(x: u64, panic: u64, y: u64) -> u64 {
    y + panic + x
}

fn fn_with_last_panic_arg(x: u64, y: u64, panic: u64) -> u64 {
    y + panic + x
}

pub fn play() -> u64 {
    not_panic();
    assert(true);

    let _ = fn_with_only_panic_arg(42);
    let _ = fn_with_first_panic_arg(42, 42);
    let _ = fn_with_middle_panic_arg(42, 42, 42);
    let _ = fn_with_last_panic_arg(42, 42, 42);

    let _ = S {}.panic();
    let _ = E::panic();
    panic()
}
