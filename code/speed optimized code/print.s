	.file	"print.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"%lf\nELAPSED TIME: %lf s.\n"
	.text
	.p2align 4
	.globl	PrintResult
	.type	PrintResult, @function
PrintResult:
	endbr64
	push	rbp
	push	rbx
	mov	rbx, rsi
	lea	rsi, .LC0[rip]
	sub	rsp, 24
	movsd	QWORD PTR 8[rsp], xmm0
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	pxor	xmm1, xmm1
	lea	rdx, .LC2[rip]
	mov	rbp, rax
	cvtsi2sd	xmm1, rbx
	mov	rdi, rax
	mov	esi, 1
	mov	eax, 2
	divsd	xmm1, QWORD PTR .LC1[rip]
	call	__fprintf_chk@PLT
	add	rsp, 24
	mov	rdi, rbp
	pop	rbx
	pop	rbp
	jmp	fclose@PLT
	.size	PrintResult, .-PrintResult
	.section	.rodata.str1.1
.LC3:
	.string	"%s\n"
	.text
	.p2align 4
	.globl	PrintError
	.type	PrintError, @function
PrintError:
	endbr64
	push	r12
	mov	r12, rdi
	mov	rdi, rsi
	lea	rsi, .LC0[rip]
	push	rbp
	sub	rsp, 8
	call	fopen@PLT
	mov	rcx, r12
	mov	esi, 1
	lea	rdx, .LC3[rip]
	mov	rbp, rax
	mov	rdi, rax
	xor	eax, eax
	call	__fprintf_chk@PLT
	add	rsp, 8
	mov	rdi, rbp
	pop	rbp
	pop	r12
	jmp	fclose@PLT
	.size	PrintError, .-PrintError
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
