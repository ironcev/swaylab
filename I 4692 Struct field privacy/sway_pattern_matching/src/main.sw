script;

mod lib;

use lib::*;

struct MainStruct {
    pub x_1: u64,
    pub x_2: u64,
    y_1: u64,
    y_2: u64,
}

impl MainStruct {
    pub fn new() -> Self {
        Self { x_1: 0, x_2: 0, y_1: 0, y_2: 0 }
    }
}

struct EmptyStruct { }

fn main() {
    let ls = LibStruct::new();

    let _ = match ls {
        LibStruct { x_1: 0, x_2: 0 } => 1,
        // ERROR BEFORE: ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Pattern does not mention fields: y_1, y_2
        LibStruct { x_1: 0, x_2: 0, y_1: 0 } => 1,
        LibStruct { x_1: 0 } => 1,
        LibStruct { x_1: 0, y_1: 0 } => 1,
        LibStruct { y_1: 0 } => 1,
        LibStruct { y_1: 0, y_2: 0 } => 1,
        LibStruct { y_1: 0, y_2: 0, .. } => 1,
        LibStruct { x_1: 0, y_2: 0, .. } => 1,
        LibStruct { x_1: 0, x_2: 0, .. } => 1,
        LibStruct { .. } => 1,
        LibStruct { } => 1,
        _ => 0,
    };

    let LibStruct { x_1, x_2 } = ls; // No error here.
    let LibStruct { } = ls; // No error here.
    let LibStruct { x_1, y_1 } = ls;
    let LibStruct { x_1, x_2, y_1, y_2 } = ls;

    let LibStruct { x_1, x_2, .. } = ls; // No error here.
    let LibStruct { .. } = ls; // No error here.
    let LibStruct { x_1, y_1, ..} = ls;

    // let LibStruct { x_1: 123, x_2 } = ls;
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ literal patterns not supported in this position

    let lspo = LibStructPrivateOnly::new();

    let _ = match lspo {
        LibStructPrivateOnly { y_1: 0 } => 1,
        LibStructPrivateOnly { y_1: 0, y_2: 0 } => 1,
        LibStructPrivateOnly { y_1: 0,  .. } => 1,
        LibStructPrivateOnly { .. } => 1,
        LibStructPrivateOnly { } => 1,
        _ => 0,
    };

    let ms = MainStruct::new();

    let _ = match ms {
        MainStruct { x_1: 0, x_2: 0 } => 1,
        MainStruct { x_1: 0, x_2: 0, y_1: 0 } => 1,
        MainStruct { x_1: 0 } => 1,
        MainStruct { x_1: 0, y_1: 0 } => 1,
        MainStruct { y_1: 0 } => 1,
        MainStruct { y_1: 0, y_2: 0 } => 1,
        MainStruct { y_1: 0, y_2: 0, .. } => 1,
        MainStruct { x_1: 0, y_2: 0, .. } => 1,
        MainStruct { x_1: 0, x_2: 0, .. } => 1,
        MainStruct { .. } => 1,
        MainStruct { } => 1,
        _ => 0,
    };

    let MainStruct { x_1, x_2 } = ls; // No error here.
    let MainStruct { } = ls; // No error here.
    let MainStruct { x_1, y_1 } = ls;
    let MainStruct { x_1, x_2, y_1, y_2 } = ls;

    let MainStruct { x_1, x_2, .. } = ls; // No error here.
    let MainStruct { .. } = ls; // No error here.
    let MainStruct { x_1, y_1, ..} = ls;

    // MainStruct { x_1, x_2, y_1, y_2 } = ms;
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ This expression cannot be assigned to.
    // MainStruct { x_1: 0, x_2, y_1, y_2 } = ms;
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ This expression cannot be assigned to.

    let es = EmptyStruct { };

    let _ = match es {
        EmptyStruct { } => 1,
        EmptyStruct { .. } => 1,
    };
}