contract;

struct S {
    u64_field: u64,
}

storage {
    x: &u8 = &0,
    //       ^^ Could not evaluate initializer to a const declaration.
    s: S = S { u64_field: 0 },
}

struct Struct {
    other: OtherStruct,
}

struct OtherStruct {
    x: u64,
}

fn access_out_of_storage() {
    let mut s = Struct { other: OtherStruct { x: 0 } };

    let _ = s.other.x.field;
    //      ^^^^^^^^^ This is a u64, not a struct. Fields can only be accessed on structs.

    s.other.x.field = 0;
  //^^^^^^^^^ This is a u64, not a struct. Fields can only be accessed on structs.
}

abi ReadStorage {
    #[storage(read)]
    fn read_storage();
}

impl ReadStorage for Contract {
    #[storage(read)]
    fn read_storage() {
        let _ = storage.x.field.read();
        let _ = storage.s.u64_field.field.read();
        //              ^^^^^^^^^ This is a u64, not a struct. Fields can only be accessed on structs.

        let _ = storage.read();

        let _ = storage.abc.read();
    }
}

fn dereferencing() {
    let s = Struct { other: OtherStruct { x: 0 } };
    let r_s = &s;
    let r_r_s = &r_s;

    let _ = r_s.other.x;
    let _ = r_r_s.other.x;
}