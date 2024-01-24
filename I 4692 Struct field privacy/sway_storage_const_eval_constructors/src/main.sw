contract;

mod lib;

use lib::*;

abi ReadStorage {
    #[storage(read)]
    fn read_storage();
}

storage {
    ls_new: LibStruct = LibStruct::new(),
    los_new: LibOtherStruct = LibOtherStruct::new(),

    ls_default: LibStruct = LibStruct::default(),
    los_default: LibOtherStruct = LibOtherStruct::default(),

    ls_new_with_param: LibStruct = LibStruct::new_with_param(12),
    los_new_with_param: LibOtherStruct = LibOtherStruct::new_with_param(12),

    ls_new_choice_of_const: LibStruct = LibStruct::new_choice_of_const(true),
    los_new_choice_of_const: LibOtherStruct = LibOtherStruct::new_choice_of_const(true),

    ls_new_not_const: LibStruct = LibStruct::new_not_const(),
    los_new_not_const: LibOtherStruct = LibOtherStruct::new_not_const(),

    ls_module_constructor: LibStruct = lib_struct_module_constructor(),
}

impl ReadStorage for Contract {
    #[storage(read)]
    fn read_storage() {
        let _ = storage.ls_new.x.read();
        let _ = storage.ls_new.other.read();
        let _ = storage.ls_new.other.x.read();

        let _ = storage.los_new.x.read();

        let _ = storage.ls_default.x.read();
        let _ = storage.ls_default.other.read();
        let _ = storage.ls_default.other.x.read();

        let _ = storage.los_default.x.read();

        let _ = storage.ls_new_with_param.x.read();
        let _ = storage.ls_new_with_param.other.read();
        let _ = storage.ls_new_with_param.other.x.read();

        let _ = storage.los_new_with_param.x.read();

        let _ = storage.ls_new_choice_of_const.x.read();
        let _ = storage.ls_new_choice_of_const.other.read();
        let _ = storage.ls_new_choice_of_const.other.x.read();

        let _ = storage.los_new_choice_of_const.x.read();

        let _ = storage.ls_module_constructor.read();
    }
}
