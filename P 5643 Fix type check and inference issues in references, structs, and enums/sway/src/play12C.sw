library;

trait MyAdd {
    fn my_add(self, other: Self) -> Self;
}

trait MyMul {
    fn my_mul(self, other: Self) -> Self;
}

impl MyAdd for u64 {
    fn my_add(self, other: Self) -> Self {
        self + other
    }
}

impl MyMul for u64 {
    fn my_mul(self, other: Self) -> Self {
        self * other
    }
}

trait MyMath: MyAdd + MyMul {

} {
    fn my_double(self) -> Self {
        self.my_add(self)
    }

    fn my_pow_2(self) -> Self {
        self.my_mul(self)
    }
}

struct MyPoint<T> {
    x: T,
    y: T,
}

impl MyMath for u64 {}

impl<T> MyPoint<T> where T: MyMath {
// impl<T> MyPoint<T> {
    fn do_math3(self, b: MyPoint<T>) -> MyPoint<T> where T: MyMath {
        MyPoint /* DEBUG_MARKER */ {
            x: self.x.my_double().my_mul(b.x.my_double()),
            y: self.y.my_pow_2().my_add(b.y.my_pow_2()),
        }
    }
}

pub fn play() -> u64 {
    let a = MyPoint {
        x: 1u64,
        y: 2u64,
    };
    assert(a.x == 1u64);
    assert(a.y == 2u64);

    let b = MyPoint {
        x: 3u64,
        y: 4u64,
    };
    assert(b.x == 3u64);
    assert(b.y == 4u64);

    let m = a.do_math3(b);
    assert(m.x == 12u64);
    assert(m.y == 20u64);

    42
}
