define i64 @main() {
entry:
  %a = alloca i64, align 4
  %a_val = load i64, i64* %a

  %sum = add i64 %a_val, %a_val

  ; %addr = ptrtoint i64* %a to i64

  ; %addr = ptrtoint i64* %a_val to i64
  ; error: '%a_val' defined with type 'i64' but expected 'i64*
  
  %addr = ptrtoint i64 %a_val to i64
  ; error: invalid cast opcode for cast from 'i64' to 'i64' 

  ret i64 %addr
}
