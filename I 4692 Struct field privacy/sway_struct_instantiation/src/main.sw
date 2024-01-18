script;

mod lib;

use lib::*;
use lib::LibStruct as LibStructAlias;

struct MainStruct {
    pub x: u64,
    y: u64,
    z: u64,
}

fn main() {
    let _ = LibOnlyPrivateFields { };
    let _ = LibOnePrivateField { };
    let _ = LibTwoPrivateFields { };
    let _ = LibThreePrivateFields { };

    let _ = LibStruct::instantiate();

    let _ = LibStruct { };

    let _ = LibStruct { x: 0 };

    let _ = LibStruct { y: 0 };

    let _ = LibStruct { z: 0 };

    let _ = LibStruct { x: 0, y: 0, z: 0 };

    let _ = LibStruct { nn: 0 };

    let _ = LibStruct { nn: 0, x: 0 };

    let _ = LibStruct { nn: 0, y: 0 };

    let _ = LibStruct { nn: 0, z: 0 };

    let _ = LibStruct { nn: 0, x: 0, y: 0, z: 0};


    let _ = LibStructAlias { };

    let _ = LibStructAlias { x: 0 };

    let _ = LibStructAlias { y: 0 };

    let _ = LibStructAlias { z: 0 };

    let _ = LibStructAlias { x: 0, y: 0, z: 0 };

    let _ = LibStructAlias { nn: 0 };

    let _ = LibStructAlias { nn: 0, x: 0 };

    let _ = LibStructAlias { nn: 0, y: 0 };

    let _ = LibStructAlias { nn: 0, z: 0 };

    let _ = LibStructAlias { nn: 0, x: 0, y: 0, z: 0 };


    let _ = MainStruct { };

    let _ = MainStruct { x: 0 };

    let _ = MainStruct { y: 0 };

    let _ = MainStruct { z: 0 };

    let _ = MainStruct { x: 0, y: 0, z: 0 };

    let _ = MainStruct { nn: 0 };

    let _ = MainStruct { nn: 0, x: 0 };

    let _ = MainStruct { nn: 0, y: 0 };

    let _ = MainStruct { nn: 0, z: 0 };

    let _ = MainStruct { nn: 0, x: 0, y: 0, z: 0 };
}
