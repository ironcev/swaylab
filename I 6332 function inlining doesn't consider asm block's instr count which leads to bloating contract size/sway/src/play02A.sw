library;

pub fn play() {
    test_function1();
    test_function2();
    test_function3();
}

fn testf() {
    asm(r1, r2) {
        movi r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
        addi r1 r2 i1;
    }
}

fn test_function1() {
    testf();
}

fn test_function2() -> bool {
    testf();
    true
}

fn test_function3() -> u64 {
    testf();
    0
}