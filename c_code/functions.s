	.file	"functions.c"
	.text
	.globl	valid_coins
	.data
	.align 16
	.type	valid_coins, @object
	.size	valid_coins, 20
valid_coins:
	.long	1028443341
	.long	1036831949
	.long	1048576000
	.long	1056964608
	.long	1065353216
	.globl	length_valid_coins
	.align 4
	.type	length_valid_coins, @object
	.size	length_valid_coins, 4
length_valid_coins:
	.long	5
	.text
	.globl	valid_coin
	.type	valid_coin, @function
valid_coin:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movss	%xmm0, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L6:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	ucomiss	-32(%rbp), %xmm0
	jp	.L3
	ucomiss	-32(%rbp), %xmm0
	jne	.L3
	movl	$1, %eax
	jmp	.L5
.L3:
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L6
	movl	$0, %eax
.L5:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	valid_coin, .-valid_coin
	.section	.rodata
.LC1:
	.string	"Ingrese Monedas: "
.LC2:
	.string	"%f"
.LC4:
	.string	"  --- MONEDA INCORRECTA --- "
	.text
	.globl	get_money
	.type	get_money, @function
get_money:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	jmp	.L9
.L14:
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %edx
	movl	length_valid_coins(%rip), %eax
	movd	%edx, %xmm0
	movl	%eax, %esi
	leaq	valid_coins(%rip), %rdi
	call	valid_coin
	cmpl	$1, %eax
	jne	.L10
	movss	-16(%rbp), %xmm0
	movss	-12(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	jmp	.L9
.L10:
	movss	-16(%rbp), %xmm0
	movss	.LC3(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L11
	movss	.LC3(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	jne	.L11
	movss	-12(%rbp), %xmm0
	jmp	.L8
.L11:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
.L9:
	movss	-16(%rbp), %xmm0
	movss	.LC3(%rip), %xmm1
	comiss	%xmm1, %xmm0
	ja	.L14
.L8:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	get_money, .-get_money
	.globl	string_length
	.type	string_length, @function
string_length:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L18
.L19:
	addl	$1, -4(%rbp)
.L18:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L19
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	string_length, .-string_length
	.globl	is_digit
	.type	is_digit, @function
is_digit:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L22
.L26:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L23
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L24
.L23:
	movl	$0, %eax
	jmp	.L25
.L24:
	addl	$1, -4(%rbp)
.L22:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L26
	movl	$1, %eax
.L25:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	is_digit, .-is_digit
	.globl	validate_number
	.type	validate_number, @function
validate_number:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	string_length
	movl	%eax, -4(%rbp)
	cmpl	$10, -4(%rbp)
	je	.L28
	movl	$0, %eax
	jmp	.L29
.L28:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L30
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	je	.L31
.L30:
	movl	$0, %eax
	jmp	.L29
.L31:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	is_digit
	testl	%eax, %eax
	jne	.L32
	movl	$0, %eax
	jmp	.L29
.L32:
	movl	$1, %eax
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	validate_number, .-validate_number
	.section	.rodata
.LC5:
	.string	"Ingrese el numero a llamar: "
.LC6:
	.string	"%s"
	.align 8
.LC7:
	.string	"\nNumero ingresado equivocado...\nIngrese el numero a llamar: "
	.text
	.globl	get_number
	.type	get_number, @function
get_number:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L34
.L35:
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.L34:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	validate_number
	testl	%eax, %eax
	je	.L35
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	get_number, .-get_number
	.globl	rand_cost
	.type	rand_cost, @function
rand_cost:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$-2078209981, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	movl	%edx, %ecx
	sarl	$4, %ecx
	cltd
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, -4(%rbp)
	movl	-4(%rbp), %ecx
	movl	%ecx, %edx
	sall	$5, %edx
	subl	%ecx, %edx
	subl	%edx, %eax
	movl	%eax, -4(%rbp)
	cvtsi2sdl	-4(%rbp), %xmm1
	movsd	.LC8(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC9(%rip), %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	rand_cost, .-rand_cost
	.section	.rodata
	.align 8
.LC10:
	.string	"%d. Llamada en curso... Presiona C para colgar\n"
	.text
	.globl	call_simulator
	.type	call_simulator, @function
call_simulator:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	movss	-20(%rbp), %xmm0
	subss	-24(%rbp), %xmm0
	movss	%xmm0, -8(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L39
.L40:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movss	-8(%rbp), %xmm0
	subss	-24(%rbp), %xmm0
	movss	%xmm0, -8(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	$1, %edi
	call	sleep@PLT
	addl	$1, -4(%rbp)
.L39:
	movss	-8(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	ja	.L40
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	call_simulator, .-call_simulator
	.section	.rodata
	.align 4
.LC3:
	.long	3212836864
	.align 8
.LC8:
	.long	0
	.long	1076101120
	.align 8
.LC9:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
