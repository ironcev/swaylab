library;

pub struct LibStruct {
    pub x: u64,
    y: u64,
    z: u64,
}

impl LibStruct {
    pub fn new() -> Self {
        Self {
            x: 0,
            y: 0,
            z: 0,
        }
    }

    pub fn same(v: u64) -> Self {
        Self {
            x: v,
            y: v,
            z: v,
        }
    }
}

trait Default {
    fn default() -> Self;
}

impl Default for LibStruct {
    fn default() -> Self {
        Self {
            x: 0,
            y: 0,
            z: 0,
        }
    }
}

trait OtherDefault {
    fn default() -> Self;
}

impl OtherDefault for LibStruct {
    fn default() -> Self {
        Self {
            x: 0,
            y: 0,
            z: 0,
        }
    }
}

pub trait New {
    fn new() -> Self;
}

impl New for LibStruct {
    fn new() -> Self {
        Self {
            x: 0,
            y: 0,
            z: 0,
        }
    }
}

trait GenericSame<T> {
    fn same(v: T) -> Self;
}

impl GenericSame<u64> for LibStruct {
    fn same(v: u64) -> Self {
        Self {
            x: v,
            y: v,
            z: v,
        }
    }
}

trait GenericTrait<T1, T2, T3> {
    fn constructor(v1: T1, v2: T2, v3: T3) -> Self;
}

impl GenericTrait<u64, u64, u64> for LibStruct {
    fn constructor(v1: u64, v2: u64, v3: u64) -> Self {
        Self {
            x: v1,
            y: v2,
            z: v3,
        }
    }
}

impl LibStruct {
    pub fn method(self) -> LibStruct {
        self
    }

    pub fn single(x: u64) -> LibStruct {
        Self {
            x,
            y: 0,
            z: 0,
        }
    }

    pub fn double(x: u64, y: u64) -> Self {
        Self {
            x,
            y,
            z: 0,
        }
    }

    pub fn triple(x: u64, y: u64, z: u64) -> Self {
        Self {
            x,
            y,
            z,
        }
    }

    fn private_new(x: u64, y: u64, z: u64) -> LibStruct {
        Self {
            x,
            y,
            z,
        }
    }

    pub fn new_something_else() -> u64 {
        0
    }
}

pub trait Instantiable {
    fn instantiate() -> Self;
}

impl<T> Instantiable for T where T: New {
    fn instantiate() -> Self {
        Self::new()
    }
}

pub struct LibOnlyPrivateFields {
    x: u64,
    y: u64,
}

pub struct LibOnePrivateField {
    pub x: u64,
    y: u64,
}

pub struct LibTwoPrivateFields {
    pub x: u64,
    y: u64,
    z: u64,
}

pub struct LibThreePrivateFields {
    pub x: u64,
    y: u64,
    z: u64,
    zz: u64,
}