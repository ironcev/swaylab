std::rt::lang_start:
	pushq	%rax
	movl	%ecx, %r8d
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	%rdi, (%rsp)
	leaq	.L__unnamed_1(%rip), %rsi
	movq	%rsp, %rdi
	callq	*std::rt::lang_start_internal@GOTPCREL(%rip)
	popq	%rcx
	retq

std::rt::lang_start::{{closure}}:
	pushq	%rax
	movq	(%rdi), %rdi
	callq	std::sys::backtrace::__rust_begin_short_backtrace
	xorl	%eax, %eax
	popq	%rcx
	retq

std::sys::backtrace::__rust_begin_short_backtrace:
	pushq	%rax
	callq	*%rdi
	#APP
	#NO_APP
	popq	%rax
	retq

core::ops::function::FnOnce::call_once{{vtable.shim}}:
	pushq	%rax
	movq	(%rdi), %rdi
	callq	std::sys::backtrace::__rust_begin_short_backtrace
	xorl	%eax, %eax
	popq	%rcx
	retq

alloc::sync::Arc<T,A>::drop_slow:
	pushq	%rbx
	movq	(%rdi), %rbx
	movq	16(%rbx), %rsi
	testq	%rsi, %rsi
	je	.LBB4_2
	movq	24(%rbx), %rdi
	movl	$1, %edx
	callq	*__rust_dealloc@GOTPCREL(%rip)

.LBB4_2:
	cmpq	$-1, %rbx
	je	.LBB4_4
	lock		decq	8(%rbx)
	jne	.LBB4_4
	#MEMBARRIER
	movl	$40, %esi
	movl	$8, %edx
	movq	%rbx, %rdi
	popq	%rbx
	jmpq	*__rust_dealloc@GOTPCREL(%rip)

.LBB4_4:
	popq	%rbx
	retq

alloc::sync::Arc<T,A>::drop_slow:
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	cmpq	$-1, %rdi
	je	.LBB5_3
	movq	8(%rax), %rsi
	lock		decq	8(%rdi)
	jne	.LBB5_3
	#MEMBARRIER
	addq	$23, %rsi
	andq	$-8, %rsi
	je	.LBB5_3
	movl	$8, %edx
	jmpq	*__rust_dealloc@GOTPCREL(%rip)

.LBB5_3:
	retq

playground::main:
	subq	$56, %rsp
	movq	%rsp, %rdi
	callq	playground::create_ident
	movq	40(%rsp), %rax
	testq	%rax, %rax
	je	.LBB6_3
	lock		decq	(%rax)
	jne	.LBB6_3
	leaq	40(%rsp), %rdi
	#MEMBARRIER
	callq	alloc::sync::Arc<T,A>::drop_slow

.LBB6_3:
	movq	8(%rsp), %rax
	lock		decq	(%rax)
	jne	.LBB6_5
	leaq	8(%rsp), %rdi
	#MEMBARRIER
	callq	alloc::sync::Arc<T,A>::drop_slow

.LBB6_5:
	addq	$56, %rsp
	retq

playground::create_ident:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$1, %edi
	xorl	%esi, %esi
	callq	*alloc::sync::arcinner_layout_for_value_layout@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	%rdx, %r14
	testq	%rdx, %rdx
	je	.LBB7_1
	movq	__rust_no_alloc_shim_is_unstable@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	*__rust_alloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.LBB7_5

.LBB7_4:
	movq	$1, (%rax)
	movq	$1, 8(%rax)
	movl	$0, (%rbx)
	movq	%rax, 8(%rbx)
	movb	$0, 48(%rbx)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 32(%rbx)
	movups	%xmm0, 16(%rbx)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq

.LBB7_1:
	movq	%r15, %rax
	testq	%rax, %rax
	jne	.LBB7_4

.LBB7_5:
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	*alloc::alloc::handle_alloc_error@GOTPCREL(%rip)

main:
	pushq	%rax
	movq	%rsi, %rcx
	movslq	%edi, %rdx
	leaq	playground::main(%rip), %rax
	movq	%rax, (%rsp)
	leaq	.L__unnamed_1(%rip), %rsi
	movq	%rsp, %rdi
	xorl	%r8d, %r8d
	callq	*std::rt::lang_start_internal@GOTPCREL(%rip)
	popq	%rcx
	retq

.L__unnamed_1:
	.asciz	"\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	core::ops::function::FnOnce::call_once{{vtable.shim}}
	.quad	std::rt::lang_start::{{closure}}
	.quad	std::rt::lang_start::{{closure}}