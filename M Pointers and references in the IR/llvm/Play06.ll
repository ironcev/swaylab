define i64 @main() {
entry:
  %a = alloca i32, align 4

  %addr = ptrtoint i32* %a to i64

  ret i64 %addr
}
