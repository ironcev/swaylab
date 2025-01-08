define i32 @main() {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4

  store i32 10, i32* %a, align 4
  store i32 20, i32* %b, align 4

  %a_val = load i32, i32* %a, align 4
  %b_val = load i32, i32* %b, align 4

  %sum = add i32 %a_val, %b_val
  store i32 %sum, i32* %c, align 4

  %c_val = load i32, i32* %c, align 4
  ret i32 %c_val
}
