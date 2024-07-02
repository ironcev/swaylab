define i64 @main() {
entry:
  %p1 = insertvalue {i32, i32} undef, i32 5, 0
  %p2 = insertvalue {i32, i32} %p1, i32 10, 1
  
  ; %addr = ptrtoint {i32, i32}* %p2 to i64
  ; error: '%p2' defined with type '{ i32, i32 }' but expected '{ i32, i32 }*'
  
  %addr = ptrtoint {i32, i32} %p2 to i64
  ; error: invalid cast opcode for cast from '{ i32, i32 }' to 'i64'

  ret i64 %addr
}
