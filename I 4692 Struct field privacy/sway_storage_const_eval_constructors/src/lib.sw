library;

pub struct LibStruct {
    pub x: u64,
    y: u64,
    pub other: LibOtherStruct,
}

impl LibStruct {
    pub fn default() -> Self {
        Self { x: 0, y: 0, other: LibOtherStruct { x: 0, y: 0, z: 0 } }
    }

    pub fn new() -> Self {
        Self { x: 10, y: 11, other: LibOtherStruct { x: 12, y: 13, z: 14 } }
    }

    pub fn new_with_param(v: u64) -> Self {
        Self { x: v, y: v, other: LibOtherStruct { x: v, y: v, z: v } }
    }

    pub fn new_choice_of_const(b: bool) -> Self {
        if b {
            Self { x: 10, y: 11, other: LibOtherStruct { x: 12, y: 13, z: 14 } }
        } else {
            Self { x: 100, y: 110, other: LibOtherStruct { x: 120, y: 130, z: 140 } }
        }
    }

    pub fn new_not_const() -> Self {
        let mut vec: Vec::<u64> = Vec::new();

        vec.push(10);
        vec.push(11);
        vec.push(12);
        vec.push(13);
        vec.push(14);

        Self {
            x: vec.get(0).unwrap(),
            y: vec.get(1).unwrap(),
            other: LibOtherStruct {
                x: vec.get(2).unwrap(),
                y: vec.get(3).unwrap(),
                z: vec.get(4).unwrap(),
            },
        }
    }
}

pub struct LibOtherStruct {
    pub x: u64,
    y: u64,
    z: u64,
}

impl LibOtherStruct {
    pub fn default() -> Self {
        Self { x: 0, y: 0, z: 0 }
    }

    pub fn new() -> Self {
        Self { x: 1, y: 2, z: 3 }
    }

    pub fn new_with_param(v: u64) -> Self {
        Self { x: v, y: v, z: v }
    }

    pub fn new_choice_of_const(b: bool) -> Self {
        if b {
            Self { x: 10, y: 11, z: 14 }
        } else {
            Self { x: 100, y: 110, z: 140 }
        }
    }

    pub fn new_not_const() -> Self {
        let mut vec: Vec::<u64> = Vec::new();

        vec.push(10);
        vec.push(11);
        vec.push(12);

        Self {
            x: vec.get(0).unwrap(),
            y: vec.get(1).unwrap(),
            z: vec.get(2).unwrap(),
        }
    }
}

pub fn lib_struct_module_constructor() -> LibStruct {
    LibStruct::new()
}