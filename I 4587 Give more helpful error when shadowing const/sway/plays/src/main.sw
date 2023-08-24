script;

mod lib;
// mod libA;

// BEGIN_PLAY
// struct MainItem { }
// enum MainItem { } // The name `MainItem` is defined multiple times
// END_PLAY

// BEGIN_PLAY
// fn before_lib_x() -> () {
//     poke(LIB_X);
// }

// use lib::LIB_X;

// // use lib::*;
// const LIB_X: u32 = 2;

// fn after_lib_x() -> () {
//     poke(LIB_X);
// }
// END_PLAY

// BEGIN_PLAY
// struct MainItem { }
// const MainItem: u32 = 1;
// END_PLAY

// BEGIN_PLAY
// struct Struct {
//     a: u64
// }

// impl Struct {
//     const X: u32 = 1;
//     const X: u32 = 2;
// }
// END_PLAY

// BEGIN_PLAY
// END_PLAY

// mod play01;
// mod play01A;
// mod play01B;
// mod play01C;
// mod play02;
// mod play02A;
// mod play03;
// mod play04;
// mod play05;
// mod play05A;
// mod play05B;
// mod play05C;
// mod play06;
// mod play07;
// mod play08;

fn main() -> () {
    // before_lib_x();
    // after_lib_x();

    // let s = Struct { a: 1 };
    // poke(s);
    // poke(s.a);
    // poke(Struct::X);

    // ::play01::play();
    // ::play01A::play();
    // ::play01B::play();
    // ::play01C::play();
    // ::play02::play();
    // ::play02A::play();
    // ::play03::play();
    ::play04::play();
    ::play05::play();
    ::play05A::play();
    ::play05B::play();
    // ::play05C::play();
    // ::play06::play();
    // ::play07::play();
    // ::play08::play();

    // poke(LIB_X);

    // use lib::LIB_X;
    // use libA::LIB_X;

    // use lib::LIB_X;
    // let LIB_X = 1;

    // let LIB_X = 1;
    // use lib::LIB_X;
    // poke(LIB_X);

    const LIB_X = 1;
    use lib::LIB_X;
    poke(LIB_X);

    // poke(LIB_X);
}

fn poke<T>(x: T) -> () { let _ = x; () }