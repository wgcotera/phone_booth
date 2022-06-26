	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"\nTotal: $ %.2f.\n\n"
.LC1:
	.string	"\nCosto por minuto: $%.2f.\n\n"
	.align 8
.LC2:
	.string	"\n\nDuracion de la llamada: %d minutos.\n\n"
.LC3:
	.string	"Costo de la llamada: $%.2f.\n\n"
.LC5:
	.string	"Cambio: $%.2f.\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %eax
	call	get_money@PLT
	movd	%xmm0, %eax
	movl	%eax, -52(%rbp)
	cvtss2sd	-52(%rbp), %xmm0
	leaq	.LC0(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	-23(%rbp), %rax
	movq	%rax, %rdi
	call	get_number@PLT
	movl	$0, %eax
	call	rand_cost@PLT
	movd	%xmm0, %eax
	movl	%eax, -48(%rbp)
	cvtss2sd	-48(%rbp), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movss	-48(%rbp), %xmm0
	movl	-52(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	call_simulator@PLT
	movss	-52(%rbp), %xmm0
	divss	-48(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, -44(%rbp)
	cvtsi2ssl	-44(%rbp), %xmm0
	movss	-48(%rbp), %xmm1
	mulss	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cvtss2sd	-40(%rbp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movss	-52(%rbp), %xmm0
	subss	-40(%rbp), %xmm0
	movss	%xmm0, -36(%rbp)
	cvtss2sd	-36(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -32(%rbp)
	cvtsi2sdl	-32(%rbp), %xmm1
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -28(%rbp)
	cvtss2sd	-28(%rbp), %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	2576980378
	.long	1068079513
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
