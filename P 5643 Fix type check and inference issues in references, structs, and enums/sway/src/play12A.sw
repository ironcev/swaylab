library;

trait MyAdd {
    fn my_add(self, other: Self) -> Self;
}

trait MyMul {
    fn my_mul(self, other: Self) -> Self;
}

impl MyAdd for u8 {
    fn my_add(self, other: Self) -> Self {
        self + other
    }
}

impl MyAdd for u16 {
    fn my_add(self, other: Self) -> Self {
        self + other
    }
}

impl MyAdd for u32 {
    fn my_add(self, other: Self) -> Self {
        self + other
    }
}

impl MyAdd for u64 {
    fn my_add(self, other: Self) -> Self {
        self + other
    }
}

impl MyMul for u8 {
    fn my_mul(self, other: Self) -> Self {
        self * other
    }
}

impl MyMul for u16 {
    fn my_mul(self, other: Self) -> Self {
        self * other
    }
}

impl MyMul for u32 {
    fn my_mul(self, other: Self) -> Self {
        self * other
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

impl MyMath for u8 {}

impl MyMath for u16 {}

impl MyMath for u32 {}

impl MyMath for u64 {}

impl<T> MyPoint<T> {
    fn do_math3(self, b: MyPoint<T>) -> MyPoint<T> where T: MyMath {
        MyPoint /* DEBUG_MARKER */ {
            x: self.x.my_double().my_mul(b.x.my_double()),
            y: self.y.my_pow_2().my_add(b.y.my_pow_2()),
        }
    }

    fn do_math4(self, b: MyPoint<T>) -> MyPoint<T> where T: MyMath {
        b
    }

    fn do_math5(self, b: MyPoint<T>) -> MyPoint<T> where T: MyMath {
        Self /* DEBUG_MARKER */ {
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

    let m = a.do_math4(b);
    assert(m.x == b.x);
    assert(m.y == b.x);

    let m = a.do_math5(b);
    assert(m.x == b.x);
    assert(m.y == b.x);

    42
}
