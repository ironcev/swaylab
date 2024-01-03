library;

use ::lib01::Lib01PublicStruct;
use ::lib01::lib01_nested::Lib01PublicNestedStruct;

use ::lib02::Lib02PublicStruct;
use ::lib02::lib02_nested::Lib02PublicNestedStruct;

pub fn test_me() {
    let _ = Lib01PublicStruct { x: 0, y: 0 };
    let _ = Lib01PublicNestedStruct { x: 0, y: 0 };

    let _ = Lib02PublicStruct { x: 0, y: 0 };
    let _ = Lib02PublicNestedStruct { x: 0, y: 0 };
}