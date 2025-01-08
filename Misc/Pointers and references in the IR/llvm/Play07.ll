define i64 @main() {
entry:
  %a = alloca i32, align 4
  %a_val = load i32, i32* %a

  %sum = add i32 %a_val, %a_val

  %addr = ptrtoint i32* %a to i64

  ; %addr = ptrtoint i32* %a_val to i64
  ; error: '%a_val' defined with type 'i32' but expected 'i32*'
  
  ; %addr = ptrtoint i32 %a_val to i64
  ; invalid cast opcode for cast from 'i32' to 'i64'

  ret i64 %addr
}
