 // rustc --target=riscv64gc-unknown-linux-gnu -C opt-level=3 -C panic=abort --emit=asm -o out.asm lib.rs
 // 31 instructions.

	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0"
	.file	"lib.14677eb333bb3b44-cgu.0"
	.section	.text._RNvCsj4CZ6flxxfE_7___rustc17rust_begin_unwind,"ax",@progbits
	.hidden	_RNvCsj4CZ6flxxfE_7___rustc17rust_begin_unwind
	.globl	_RNvCsj4CZ6flxxfE_7___rustc17rust_begin_unwind
	.p2align	1
	.type	_RNvCsj4CZ6flxxfE_7___rustc17rust_begin_unwind,@function
_RNvCsj4CZ6flxxfE_7___rustc17rust_begin_unwind:
.LBB0_1:
	j	.LBB0_1
.Lfunc_end0:
	.size	_RNvCsj4CZ6flxxfE_7___rustc17rust_begin_unwind, .Lfunc_end0-_RNvCsj4CZ6flxxfE_7___rustc17rust_begin_unwind

	.section	.text.largest_prime_factor,"ax",@progbits
	.globl	largest_prime_factor
	.p2align	1
	.type	largest_prime_factor,@function
largest_prime_factor:
	li	a1, 2
	bltu	a0, a1, .LBB1_7
	andi	a1, a0, 1
	bnez	a1, .LBB1_4
.LBB1_2:
	andi	a1, a0, 2
	srli	a0, a0, 1
	beqz	a1, .LBB1_2
	li	a1, 2
	li	a2, 9
	bltu	a0, a2, .LBB1_5
	j	.LBB1_8
.LBB1_4:
	li	a1, 0
	li	a2, 9
	bgeu	a0, a2, .LBB1_8
.LBB1_5:
	li	a2, 1
	bltu	a2, a0, .LBB1_7
	mv	a0, a1
.LBB1_7:
	ret
.LBB1_8:
	li	a2, 3
	j	.LBB1_10
.LBB1_9:
	addi	a2, a2, 2
	mul	a3, a2, a2
	bltu	a0, a3, .LBB1_5
.LBB1_10:
	beqz	a2, .LBB1_14
	remu	a3, a0, a2
	bnez	a3, .LBB1_9
.LBB1_12:
	divu	a0, a0, a2
	remu	a1, a0, a2
	beqz	a1, .LBB1_12
	mv	a1, a2
	j	.LBB1_9
.LBB1_14:
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.1)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	call	_ZN4core9panicking11panic_const23panic_const_rem_by_zero17h258d0161c2f72df2E
.Lfunc_end1:
	.size	largest_prime_factor, .Lfunc_end1-largest_prime_factor

	.type	.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.0,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.0:
	.asciz	"lib.rs"
	.size	.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.0, 7

	.type	.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.1,@object
	.section	.data.rel.ro..Lanon.6a47fc8af913b22c8a9ee0178fa2c307.1,"aw",@progbits
	.p2align	3, 0x0
.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.1:
	.quad	.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.0
	.asciz	"\006\000\000\000\000\000\000\000\032\000\000\000\017\000\000"
	.size	.Lanon.6a47fc8af913b22c8a9ee0178fa2c307.1, 24

	.ident	"rustc version 1.90.0 (1159e78c4 2025-09-14)"
	.section	".note.GNU-stack","",@progbits
