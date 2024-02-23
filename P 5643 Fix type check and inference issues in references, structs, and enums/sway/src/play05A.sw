library;

use std::option::Option as OptionAlias;

enum MyOption {
    Some: bool,
    None: (),
}

enum MyOtherOption {
    NoSome: bool,
    None: (),
}

pub fn play() {
    let _: MyOption = Option::Some(123);
    let _: MyOption = Option::None;

    let _: MyOtherOption = Option::Some(123);
    let _: MyOtherOption = Option::None;

    let o: OptionAlias<u8> = Option::Some(123);
    match o {
        Some(x) => x == 123u8,
        _ => false,
    };

    let o: Option<u8> = OptionAlias::Some(123);
    match o {
        Some(x) => x == 123u8,
        _ => false,
    };

    let o: OptionAlias<u8> = Option::Some(123u64);
    match o {
        Some(x) => x == 123u8,
        _ => false,
    };

    let o: Option<u8> = OptionAlias::Some(123u64);
    match o {
        Some(x) => x == 123u8,
        _ => false,
    };

    let _: Option<u8> = Option::Some(123u64);

    let _: Option<u8> = Option::Some::<bool>(true);

    let _: Option<u8> = Option::Some::<bool>("not bool");

    let o: Option<_> = OptionAlias::Some(123u8);
    match o {
        Some(x) => x == 123u64,
        _ => false,
    };
}

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:16:36
//    |
// 14 | 
// 15 | pub fn play() {
// 16 |     let _: MyOption = Option::Some(123);
//    |                                    ^^^ Mismatched types.
// expected: bool
// found:    numeric.
// help: Enum instantiator must match its declared variant type.
// 17 |     let _: MyOption = Option::None;
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:16:23
//    |
// 14 | 
// 15 | pub fn play() {
// 16 |     let _: MyOption = Option::Some(123);
//    |                       ^^^^^^^^^^^^^^^^^ Mismatched types.
// expected: MyOption
// found:    Option<numeric>.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
// 17 |     let _: MyOption = Option::None;
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:17:23
//    |
// 15 | 
// 16 |     let _: MyOption = Option::Some(123);
// 17 |     let _: MyOption = Option::None;
//    |                       ^^^^^^^^^^^^ Mismatched types.
// expected: MyOption
// found:    Option<T>.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
// 18 | 
// 19 |     let _: MyOtherOption = Option::Some(123);
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:19:36
//    |
// 17 | 
// 18 | 
// 19 |     let _: MyOtherOption = Option::Some(123);
//    |                                    ^^^^ Variant "Some" does not exist on enum "MyOtherOption"
// 20 |     let _: MyOtherOption = Option::None;
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:20:28
//    |
// 18 | 
// 19 |     let _: MyOtherOption = Option::Some(123);
// 20 |     let _: MyOtherOption = Option::None;
//    |                            ^^^^^^^^^^^^ Mismatched types.
// expected: MyOtherOption
// found:    Option<T>.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
// 21 | 
// 22 |     let o: OptionAlias<u8> = Option::Some(123);
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:34:43
//    |
// 32 | 
// 33 | 
// 34 |     let o: OptionAlias<u8> = Option::Some(123u64);
//    |                                           ^^^^^^ Mismatched types.
// expected: u8
// found:    u64.
// help: Enum instantiator must match its declared variant type.
// 35 |     match o {
// 36 |         Some(x) => x == 123u8,
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:34:30
//    |
// 32 | 
// 33 | 
// 34 |     let o: OptionAlias<u8> = Option::Some(123u64);
//    |                              ^^^^^^^^^^^^^^^^^^^^ Mismatched types.
// expected: u8
// found:    u64.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
// 35 |     match o {
// 36 |         Some(x) => x == 123u8,
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:36:25
//    |
// 34 | 
// 35 |     match o {
// 36 |         Some(x) => x == 123u8,
//    |                         ^^^^^ Mismatched types.
// expected: u64
// found:    u8.
// help: This argument's type is not castable to the declared parameter type.
// 37 |         _ => false,
// 38 |     };
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:40:43
//    |
// 38 | 
// 39 | 
// 40 |     let o: Option<u8> = OptionAlias::Some(123u64);
//    |                                           ^^^^^^ Mismatched types.
// expected: u8
// found:    u64.
// help: Enum instantiator must match its declared variant type.
// 41 |     match o {
// 42 |         Some(x) => x == 123u8,
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:40:25
//    |
// 38 | 
// 39 | 
// 40 |     let o: Option<u8> = OptionAlias::Some(123u64);
//    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^ Mismatched types.
// expected: u8
// found:    u64.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
// 41 |     match o {
// 42 |         Some(x) => x == 123u8,
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:42:25
//    |
// 40 | 
// 41 |     match o {
// 42 |         Some(x) => x == 123u8,
//    |                         ^^^^^ Mismatched types.
// expected: u64
// found:    u8.
// help: This argument's type is not castable to the declared parameter type.
// 43 |         _ => false,
// 44 |     };
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:46:38
//    |
// 44 | 
// 45 | 
// 46 |     let _: Option<u8> = Option::Some(123u64);
//    |                                      ^^^^^^ Mismatched types.
// expected: u8
// found:    u64.
// help: Enum instantiator must match its declared variant type.
// 47 | 
// 48 |     let _: Option<u8> = Option::Some::<bool>(true);
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:46:25
//    |
// 44 | 
// 45 | 
// 46 |     let _: Option<u8> = Option::Some(123u64);
//    |                         ^^^^^^^^^^^^^^^^^^^^ Mismatched types.
// expected: u8
// found:    u64.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
// 47 | 
// 48 |     let _: Option<u8> = Option::Some::<bool>(true);
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:48:46
//    |
// 46 | 
// 47 | 
// 48 |     let _: Option<u8> = Option::Some::<bool>(true);
//    |                                              ^^^^ Mismatched types.
// expected: u8
// found:    bool.
// help: Enum instantiator must match its declared variant type.
// 49 | }
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:48:25
//    |
// 46 | 
// 47 | 
// 48 |     let _: Option<u8> = Option::Some::<bool>(true);
//    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^ Mismatched types.
// expected: Option<u8>
// found:    Option<bool>.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
// 49 | }
//    |
// ____

// error
//   --> /home/igor/p/sway/sway-lib-std/src/option.sw:82:17
//    |
// 80 | 
// 81 | /// A type that represents an optional value, either `Some(val)` or `None`.
// 82 | pub enum Option<T> {
//    |                 ^ Cannot infer type for type parameter "T". Insufficient type information provided. Try annotating its type.
// 83 |     /// No value.
// 84 |     None: (),
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:17:23
//    |
// 15 | 
// 16 |     let _: MyOption = Option::Some(123);
// 17 |     let _: MyOption = Option::None;
//    |                       ^^^^^^ Cannot infer type for type parameter "T". Insufficient type information provided. Try annotating its type.
// 18 | 
// 19 |     let _: MyOtherOption = Option::Some(123);
//    |
// ____

// error
//   --> /home/igor/p/swaylab/referencing mutable values/src/play05.sw:20:28
//    |
// 18 | 
// 19 |     let _: MyOtherOption = Option::Some(123);
// 20 |     let _: MyOtherOption = Option::None;
//    |                            ^^^^^^ Cannot infer type for type parameter "T". Insufficient type information provided. Try annotating its type.
// 21 | 
// 22 |     let o: OptionAlias<u8> = Option::Some(123);
//    |
