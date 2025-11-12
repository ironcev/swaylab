library;

// #[inline(never)]
#[inline(always)]
fn largest_prime_factor(n: u64) -> u64 {
    let mut n = n;

    if n <= 1 {
        return n;
    }

    let mut max_factor = 0;

    while n % 2 == 0 {
        max_factor = 2;
        n /= 2;
    }

    let mut i = 3;
    while i * i <= n {
        while n % i == 0 {
            max_factor = i;
            n /= i;
        }
        i += 2;
    }

    if n > 1 {
        max_factor = n;
    }

    max_factor
}

#[test]
fn bench_largest_prime_factor() {
    // let _ = largest_prime_factor(1000);
    // let _ = largest_prime_factor(13195);
    // let _ = largest_prime_factor(8388608);
    // let _ = largest_prime_factor(4194304);
    // let _ = largest_prime_factor(4096);
    // let _ = largest_prime_factor(8192);
    // let _ = largest_prime_factor(16384);
    // let _ = largest_prime_factor(32768);
    // let _ = largest_prime_factor(65536);
    // let _ = largest_prime_factor(131072);
    // let _ = largest_prime_factor(262144);
    // let _ = largest_prime_factor(262143);
    // let _ = largest_prime_factor(262142);
    // let _ = largest_prime_factor(16777215);
    // let _ = largest_prime_factor(600851475143);
    // let _ = largest_prime_factor(9223372021822390277);
    // let _ = largest_prime_factor(9223372021822390277 / 2);
}

#[test]
fn bench_largest_prime_factor_in_test() {
    // let mut n = 13195; // Gas: 256.
    // let mut n = 262142; // Gas: 3720.
    // let mut n = 16777215; // Gas: 332.
    // let mut n = 16777216; // Gas: 580.
    // let mut n = 9223372021822390277; // Gas: <panic>.
    let mut n = 9223372021822390277 / 2; // Gas: 303556.

    if n <= 1 {
        return;
    }

    let mut max_factor = 0;

    while n % 2 == 0 {
        max_factor = 2;
        n /= 2;
    }

    let mut i = 3;
    while i * i <= n {
        while n % i == 0 {
            max_factor = i;
            n /= i;
        }
        i += 2;
    }

    if n > 1 {
        max_factor = n;
    }

    let _ = max_factor;
}

#[test]
fn bench_largest_prime_factor_in_test_asm() {
    asm(r0, r1, r2, r3, r4) {
        // movi r1 i13195; // Gas: 256.
        movi r1 i262142; // Gas: 3720.
        move r4 zero;
        movi r0 i2;
        mod  r0 r1 r0;
    // .LBB_G
        eq   r0 r0 zero;
    // .LBB_F
        move r3 r1;
        movi r2 i3;
        jnzf r0 zero i15; // .LBB_A [F]
    // .LBB_E
        mul  r0 r2 r2;
        lt   r1 r0 r3;
        jnzf r1 zero i1; // .LBB_B [F]
        eq   r1 r0 r3;
    // .LBB_B
        jnzf r1 zero i1; // .LBB_C [F]
        ret  zero;
    // .LBB_C
        mod  r0 r3 r2;
        eq   r0 r0 zero;
        jnzf r0 zero i3; // .LBB_D [F]
        movi r0 i2;
        add  r2 r2 r0;
        jmpb zero i10; // .LBB_E [B]
    // .LBB_D
        div  r3 r3 r2;
        move r4 r2;
        jmpb zero i7; // .LBB_F [B]
    // .LBB_A
        movi r0 i2;
        div  r1 r1 r0;
        movi r4 i2;
        jmpb zero i23; // .LBB_G [B]
    }
}

#[test]
fn bench_largest_prime_factor_in_test_asm_input_in_var() {
    // let mut n = 16777215; // Gas: 332.
    // let mut n = 16777216; // Gas: 580.
    // let mut n = 9223372021822390277; // Gas: <panic>.
    // let mut n = 9223372021822390277 / 2; // Gas: 303556.

    // let n: u64 = 13195; // Gas: 258.
    // let n: u64 = 262142; // Gas: 3722.
    // let n: u64 = 16777215; // Gas: 334.
    // let n: u64 = 16777216; // Gas: 582.
    // let n: u64 = 9223372021822390277 / 2; // Gas: 303558.
    let n: u64 = 9223372021822390277 / 2 + 1; // Gas: 92598.
    asm(r0, r1, r2, r3, r4, n: n) {
        move r1 n;
        move r4 zero;
        movi r0 i2;
        mod  r0 r1 r0;
        eq   r0 r0 zero;
        move r3 r1;
        movi r2 i3;
        jnzf r0 zero i15;
        mul  r0 r2 r2;
        lt   r1 r0 r3;
        jnzf r1 zero i1;
        eq   r1 r0 r3;
        jnzf r1 zero i1;
        ret  zero;
        mod  r0 r3 r2;
        eq   r0 r0 zero;
        jnzf r0 zero i3;
        movi r0 i2;
        add  r2 r2 r0;
        jmpb zero i10;
        div  r3 r3 r2;
        move r4 r2;
        jmpb zero i7;
        movi r0 i2;
        div  r1 r1 r0;
        movi r4 i2;
        jmpb zero i23;
    }
}

#[test]
fn bench_largest_prime_factor_in_test_riscv_port_asm() {
    asm(r0, r1, r2, r3, r4, r5, r6) {
        movi r0 i13195; // Gas: 159.
        // movi r0 i262142; // Gas: 6241.

        // 	li	a3, 0
        movi r3 i0;
    // .LBB1_2:
        // 	mv	a1, a0
        move r1 r0;
        // 	mv	a2, a3
        move r2 r3;
        // 	andi	a4, a0, 1
        andi r4 r0 i1;
        // 	srli	a0, a0, 1
        srli r0 r0 i1;
        // 	li	a3, 2
        movi r3 i2;
        // 	beqz	a4, .LBB1_2 [B]
        eq r6 r4 zero;
        jnzb r6 zero i5;
        // 	li	a0, 3
        movi r0 i3;
    // .LBB1_4:
        // 	mul	a3, a0, a0
        mul  r3 r0 r0;
        // 	bltu	a1, a3, .LBB1_8 [F]
        lt  r6 r1 r3;
        jnzf r6 zero i14;
        // 	beqz	a0, .LBB1_12 [F]
        eq r6 r0 zero;
        jnzf r6 zero i16;
    // .LBB1_6:
        // 	mv	a3, a1
        move r3 r1;
        // 	divu	a1, a1, a0
        div r1 r1 r0;
        // 	mul	a4, a1, a0
        mul r4 r1 r0;
        // 	sub	a5, a3, a4
        sub r5 r3 r4;
        // 	mv	a4, a2
        move r4 r2;
        // 	mv	a2, a0
        move r2 r0;
        // 	beqz	a5, .LBB1_6 [B]
        eq r6 r5 zero;
        jnzb r6 zero i6;
        // 	addi	a0, a0, 2
        addi r0 r0 i2;
        // 	mv	a2, a4
        move r2 r4;
        // 	mv	a1, a3
        move r1 r3;
        // 	j	.LBB1_4 [B]
        jmpb zero i15;
    // .LBB1_8:
        // 	li	a0, 1
        movi r0 i1;
        // 	bltu	a0, a1, .LBB1_10 [F]
        lt  r6 r0 r1;
        jnzf r6 zero i1;
        // 	mv	a1, a2
        move r1 r2;
    // .LBB1_10:
        // 	mv	a0, a1
        move r0 r1;
    // .LBB1_11:
        // 	ret
        noop;
    // .LBB1_12:
    }
}

#[test]
fn bench_largest_prime_factor_in_test_riscv_port_asm_input_in_var() {
    // let n: u64 = 13195; // Gas: 161.
    // let n: u64 = 262142; // Gas: 6243.
    // let n: u64 = 16777215; // Gas: 127.
    // let n: u64 = 16777216; // Gas: 401.
    // let n: u64 = 9223372021822390277 / 2; // Gas: 309.
    let n: u64 = 9223372021822390277 / 2 + 1; // Gas: <panic>.
    asm(r0, r1, r2, r3, r4, r5, r6, n: n) {
        move r0 n;

        // 	li	a3, 0
        movi r3 i0;
    // .LBB1_2:
        // 	mv	a1, a0
        move r1 r0;
        // 	mv	a2, a3
        move r2 r3;
        // 	andi	a4, a0, 1
        andi r4 r0 i1;
        // 	srli	a0, a0, 1
        srli r0 r0 i1;
        // 	li	a3, 2
        movi r3 i2;
        // 	beqz	a4, .LBB1_2 [B]
        eq r6 r4 zero;
        jnzb r6 zero i5;
        // 	li	a0, 3
        movi r0 i3;
    // .LBB1_4:
        // 	mul	a3, a0, a0
        mul  r3 r0 r0;
        // 	bltu	a1, a3, .LBB1_8 [F]
        lt  r6 r1 r3;
        jnzf r6 zero i14;
        // 	beqz	a0, .LBB1_12 [F]
        eq r6 r0 zero;
        jnzf r6 zero i16;
    // .LBB1_6:
        // 	mv	a3, a1
        move r3 r1;
        // 	divu	a1, a1, a0
        div r1 r1 r0;
        // 	mul	a4, a1, a0
        mul r4 r1 r0;
        // 	sub	a5, a3, a4
        sub r5 r3 r4;
        // 	mv	a4, a2
        move r4 r2;
        // 	mv	a2, a0
        move r2 r0;
        // 	beqz	a5, .LBB1_6 [B]
        eq r6 r5 zero;
        jnzb r6 zero i6;
        // 	addi	a0, a0, 2
        addi r0 r0 i2;
        // 	mv	a2, a4
        move r2 r4;
        // 	mv	a1, a3
        move r1 r3;
        // 	j	.LBB1_4 [B]
        jmpb zero i15;
    // .LBB1_8:
        // 	li	a0, 1
        movi r0 i1;
        // 	bltu	a0, a1, .LBB1_10 [F]
        lt  r6 r0 r1;
        jnzf r6 zero i1;
        // 	mv	a1, a2
        move r1 r2;
    // .LBB1_10:
        // 	mv	a0, a1
        move r0 r1;
    // .LBB1_11:
        // 	ret
        noop;
    // .LBB1_12:
    }
}
