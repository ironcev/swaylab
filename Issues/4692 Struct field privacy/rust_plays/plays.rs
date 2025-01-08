struct S {
    x: u8,
}

struct Empty { }

fn main() {
    let s = S { x: 0, y: 0 };
    
    let _ = s.z;

    let s = Empty { x: 0 };
    
    let _ = s.z;
}

// error[E0560]: struct `S` has no field named `y`
//  --> src/main.rs:8:23
//   |
// 8 |     let s = S { x: 0, y: 0 };
//   |                       ^ `S` does not have this field
//   |
//   = note: all struct fields are already assigned
// 
// error[E0609]: no field `z` on type `S`
//   --> src/main.rs:10:15
//    |
// 10 |     let _ = s.z;
//    |               ^ help: a field with a similar name exists: `x`
// 
// error[E0560]: struct `Empty` has no field named `x`
//   --> src/main.rs:12:21
//    |
// 12 |     let s = Empty { x: 0 };
//    |                     ^ `Empty` does not have this field
//    |
//    = note: all struct fields are already assigned
// 
// error[E0609]: no field `z` on type `Empty`
//   --> src/main.rs:14:15
//    |
// 14 |     let _ = s.z;
//    |               ^ unknown field
