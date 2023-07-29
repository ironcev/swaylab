library;

struct S { }

impl S {
    fn a() {
        fn S_a_inner() {}
    }

    fn m(self) {
        fn S_m_inner() {}
    }
}

trait T {
    fn t();
}

impl T for S {
    fn t() {
        fn S_as_T_t() {}
    }
}

pub fn play() -> () {
    fn inner() {} // Unimplemented feature: Nested function definitions are not allowed at this time.

    inner();
}

fn poke<T>(x: T) -> () { let _ = x; () }