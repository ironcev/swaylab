use std::arch::asm;

struct MyStruct {
    field1: u64,
    field2: u64,
}

fn increment_fields_on_ref(s: &mut MyStruct) {
    unsafe {
        asm!(
            "add qword ptr [{0}], 100",
            "add qword ptr [{0} + 8], 100",
            //in(reg) s as *mut MyStruct,
            in(reg) s,
        );
    }
}

fn increment_fields_on_ptr(s: *mut MyStruct) {
    unsafe {
        asm!(
            "add qword ptr [{0}], 100",
            "add qword ptr [{0} + 8], 100",
            in(reg) s,
        );
    }
}

fn increment_fields_on_val(mut s: MyStruct) {
    unsafe {
        asm!(
            "add qword ptr [{0}], 100",
            "add qword ptr [{0} + 8], 100",
            in(reg) s,
// error: cannot use value of type `MyStruct` for inline assembly
//   --> src/main.rs:36:21
//    |
// 36 |             in(reg) s,
//    |                     ^
//    |
//    = note: only integers, floats, SIMD vectors, pointers and function pointers can be used as arguments for inline assembly
        );
    }
}


fn main() {
    let mut my_struct = MyStruct {
        field1: 10,
        field2: 20,
    };

    increment_fields_on_ref(&mut my_struct);

    println!("field1: {}", my_struct.field1);
    println!("field2: {}", my_struct.field2);
    
    increment_fields_on_ptr((&mut my_struct) as *mut MyStruct);

    println!("field1: {}", my_struct.field1);
    println!("field2: {}", my_struct.field2);
    
    increment_fields_on_val(my_struct);
}

