library;

struct S { }

struct SN { }

impl SN {
    fn next(self) -> Option<()> {
        None
    }
}

trait T {
    fn next(self) -> Option<()>;
}

struct ST { }

impl T for ST {
    fn next(self) -> Option<()> {
        None
    }
}

trait TI {
    type Item;
    fn next(self) -> Option<Self::Item>;
}

struct STI { }

impl TI for STI {
    type Item = ();
    fn next(self) -> Option<()> {
        None
    }
}

#[inline(never)]
pub fn play() {
    // for _x in S {} { }
    //           ^ Identifier "S" was used as a variable, but it is actually a struct.
    
    // for _x in (S {}) { }
    
    // for _x in (SN {}) { }
    // 197 |     pub fn unwrap(self) -> T {
    // 198 |         match self {
    //     |               ^^^^ Internal compiler error: Failed to get variant type from enum in `unsigned downcast`.
    
    // let sn = SN {};
    // for _x in sn { }
    // ERR: Ibid.

    // let st = ST {};
    // for _x in st { }
    // ERR: Ibid.

    let sti = STI {};
    for _x in sti { }
    // ERR: Ibid.
}

// for _x in (S {}) { }
// error
//   --> /home/kebradalaonda/p/swaylab/temp_iterator/sway/src/play01A.sw:44:15
//    |
// 42 |     //           ^ Identifier "S" was used as a variable, but it is actually a struct.
// 43 |     
// 44 |     for _x in (S {}) { }
//    |               ^^^^^^ No method "next(S)" found for type "S".
// 45 |     
// 46 |     // for _x in (SN {}) { }
//    |
// ____

// error: No method "is_none({unknown}) -> bool" found for type "{unknown}".
// ____

// error
//   --> /home/kebradalaonda/p/swaylab/temp_iterator/sway/src/play01A.sw:44:15
//    |
// 42 |     //           ^ Identifier "S" was used as a variable, but it is actually a struct.
// 43 |     
// 44 |     for _x in (S {}) { }
//    |               ^^^^^^ No method "unwrap({unknown})" found for type "{unknown}".