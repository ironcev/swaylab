define i32 @main() {
entry:
  %a = add i32 10, 20
  %b = mul i32 %a, 2

  ; store i32 22, i32* %b
  ; error: '%b' defined with type 'i32' but expected 'i32*'

  ; store i32 22, i32 %b
  ; error: store operand must be a pointer

  ret i32 %b
}
