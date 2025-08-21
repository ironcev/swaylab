library;

struct S { }

struct SN { }

impl SN {
    fn next(ref mut self) -> Option<()> {
        None
    }
}

trait T {
    fn next(ref mut self) -> Option<()>;
}

struct ST { }

impl T for ST {
    fn next(ref mut self) -> Option<()> {
        None
    }
}

trait TI {
    type Item;
    fn next(ref mut self) -> Option<Self::Item>;
}

struct STI { }

impl TI for STI {
    type Item = ();
    fn next(ref mut self) -> Option<()> {
        None
    }
}

#[inline(never)]
pub fn play() {
    // for _x in S {} { }
    //           ^ Identifier "S" was used as a variable, but it is actually a struct.
    
    // ERR: Same like in play01A.
    // for _x in (S {}) { }
    
    // for _x in (SN {}) { }
    
    // let sn = SN {};
    // for _x in sn { }

    // let st = ST {};
    // for _x in st { }

    let sti = STI {};
    for _x in sti { }
}
