trait MyMath {
    fn my_double(&self) -> Self;
    fn my_pow_2(&self) -> Self;
    fn add(&self, other: &Self) -> Self;
}

struct MyPoint<T> {
    x: T,
    y: T,
}

impl MyMath for u64 {
    fn my_double(&self) -> Self {
        *self * 2
    }
    
    fn my_pow_2(&self) -> Self {
        *self ^ 2
    }
    
    fn add(&self, other: &Self) -> Self {
        *self + *other
    }
}

impl<T> MyPoint<T> {
    fn do_math3(self, b: MyPoint<T>) -> MyPoint<T> where T: MyMath {
        MyPoint {
            x: self.x.my_double().add(&b.x.my_double()),
            y: self.y.my_pow_2().add(&b.y.my_pow_2()),
        }
    }
    
    fn do_math4(self, b: MyPoint<T>) -> MyPoint<T> {
        b
    }
}


pub fn play() -> u64 {
    let a = MyPoint {
        x: 1u64,
        y: 2u64,
    };

    let b = MyPoint {
        x: 3u64,
        y: 4u64,
    };

    let _ = a.do_math3(b);
    
    // ------------------

    let a = MyPoint {
        x: 1u32,
        y: 2u32,
    };

    let b = MyPoint {
        x: 3u64,
        y: 4u64,
    };

    let _ = a.do_math3(b);
    
    let _ = a.do_math4(b);

    // ------------------
    
    let a = MyPoint {
        x: 1u32,
        y: 2u32,
    };
    
    assert!(a.y == 2u32);
    assert!(a.y == 2u32);

    let b = MyPoint {
        x: 3u32,
        y: 4u32,
    };

    let _ = a.do_math3(b);
    
    let _ = a.do_math4(b);
    
    42
}


// error[E0277]: the trait bound `u32: MyMath` is not satisfied
//   --> src/lib.rs:65:15
//    |
// 65 |     let _ = a.do_math3(b);
//    |               ^^^^^^^^ the trait `MyMath` is not implemented for `u32`
//    |
//    = help: the trait `MyMath` is implemented for `u64`
// note: required by a bound in `MyPoint::<T>::do_math3`
//   --> src/lib.rs:27:61
//    |
// 27 |     fn do_math3(self, b: MyPoint<T>) -> MyPoint<T> where T: MyMath {
//    |                                                             ^^^^^^ required by this bound in `MyPoint::<T>::do_math3`
// 
// error[E0308]: mismatched types
//   --> src/lib.rs:65:24
//    |
// 65 |     let _ = a.do_math3(b);
//    |               -------- ^ expected `MyPoint<u32>`, found `MyPoint<u64>`
//    |               |
//    |               arguments to this method are incorrect
//    |
//    = note: expected struct `MyPoint<u32>`
//               found struct `MyPoint<u64>`
// note: method defined here
//   --> src/lib.rs:27:8
//    |
// 27 |     fn do_math3(self, b: MyPoint<T>) -> MyPoint<T> where T: MyMath {
//    |        ^^^^^^^^       -------------
// 
// error[E0308]: mismatched types
//   --> src/lib.rs:67:24
//    |
// 67 |     let _ = a.do_math4(b);
//    |               -------- ^ expected `MyPoint<u32>`, found `MyPoint<u64>`
//    |               |
//    |               arguments to this method are incorrect
//    |
//    = note: expected struct `MyPoint<u32>`
//               found struct `MyPoint<u64>`
// note: method defined here
//   --> src/lib.rs:34:8
//    |
// 34 |     fn do_math4(self, b: MyPoint<T>) -> MyPoint<T> {
//    |        ^^^^^^^^       -------------
