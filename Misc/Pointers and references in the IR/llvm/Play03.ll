define {i32, i32} @main() {
entry:
  %p1 = insertvalue {i32, i32} undef, i32 5, 0
  %p2 = insertvalue {i32, i32} %p1, i32 10, 1
  
  %x = extractvalue {i32, i32} %p2, 0
  %y = extractvalue {i32, i32} %p2, 1

  %sum = add i32 %x, %y
  %result = insertvalue {i32, i32} undef, i32 %sum, 0
  
  ; %ptr = getelementptr inbounds {i32, i32}, {i32, i32}* %result, i32 0, i32 1
  ; error: '%result' defined with type '{ i32, i32 }' but expected '{ i32, i32 }*
  
  %ptr = getelementptr inbounds {i32, i32}, {i32, i32} %result, i32 0, i32 1
  ; error: base of getelementptr must be a pointer

  ret {i32, i32} %result
}
