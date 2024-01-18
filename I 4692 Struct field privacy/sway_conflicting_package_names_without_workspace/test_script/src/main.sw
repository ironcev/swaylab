script;

mod lib01;

use test_lib::lib01::Lib01PublicStruct as ImportedLib01PublicStruct;
use lib01::Lib01PublicStruct;

fn main() {
    let _ = ImportedLib01PublicStruct { x: 0, y: 0 };
    let _ = Lib01PublicStruct { x: 0, y: 0 };
}