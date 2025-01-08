script;

trait Trait<T> {
    fn ret(self) -> T;
}

struct S { }

impl Trait<u64> for S {
    fn ret(self) -> u64 {
        0
    }
}

impl Trait<u32> for S {
    fn ret(self) -> u32 {
        0
    }
}

fn fun<T>(x: T) -> u64
where T: Trait<u64> + Trait<u32> {
    x.ret()
}

fn main() {
    let s = S { };

    let _ = fun(s);
}
