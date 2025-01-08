// GCC x86-64

void test() {
}

test():
        push    rbp
        mov     rbp, rsp
        nop
        pop     rbp
        ret


void test() {
    while (true) {};
}

test():
        push    rbp
        mov     rbp, rsp
.L2:
        jmp     .L2


void test() {
    throw 0;
}

test():
        push    rbp
        mov     rbp, rsp
        mov     edi, 4
        call    __cxa_allocate_exception
        mov     DWORD PTR [rax], 0
        mov     edx, 0
        mov     esi, OFFSET FLAT:typeinfo for int
        mov     rdi, rax
        call    __cxa_throw


int test(int a) {
    while (true) {};
    return a + a;
}


test(int):
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi
.L2:
        jmp     .L2
