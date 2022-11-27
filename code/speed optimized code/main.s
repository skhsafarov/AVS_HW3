	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"../out/out.txt"
.LC1:
	.string	"The option is not correct!"
.LC2:
	.string	"i:o:g"
.LC5:
	.string	"r"
.LC6:
	.string	"Input file does not exist!"
.LC8:
	.string	"%lf"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC10:
	.string	"Invalid value! [-1 <= x <= 1]"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	xor	r15d, r15d
	push	r14
	xor	r14d, r14d
	push	r13
	xor	r13d, r13d
	push	r12
	lea	r12, .LC2[rip]
	push	rbp
	mov	ebp, edi
	push	rbx
	mov	rbx, rsi
	sub	rsp, 40
.L2:
	mov	rdx, r12
	mov	rsi, rbx
	mov	edi, ebp
	call	getopt@PLT
	cmp	eax, -1
	je	.L21
	cmp	eax, 105
	je	.L3
	cmp	eax, 111
	je	.L4
	cmp	eax, 103
	je	.L22
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	PrintError@PLT
.L7:
	add	rsp, 40
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	mov	r13d, 1
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	mov	r14, QWORD PTR optarg[rip]
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	mov	r15, QWORD PTR optarg[rip]
	jmp	.L2
.L21:
	test	r13b, r13b
	je	.L9
	xor	edi, edi
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	mov	ebp, eax
	call	clock@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, ebp
	divsd	xmm0, QWORD PTR .LC3[rip]
	addsd	xmm0, xmm0
	mov	rbx, rax
	subsd	xmm0, QWORD PTR .LC4[rip]
.L19:
	call	ArcCos@PLT
	movsd	QWORD PTR 8[rsp], xmm0
	call	clock@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rdi, r14
	sub	rax, rbx
	mov	rsi, rax
	call	PrintResult@PLT
	jmp	.L7
.L9:
	lea	rsi, .LC5[rip]
	mov	rdi, r15
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L23
	mov	rdi, rax
	lea	rdx, 24[rsp]
	xor	eax, eax
	mov	QWORD PTR 24[rsp], 0x000000000
	lea	rsi, .LC8[rip]
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	movsd	xmm1, QWORD PTR .LC9[rip]
	comisd	xmm1, xmm0
	ja	.L12
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L17
.L12:
	mov	rsi, r14
	lea	rdi, .LC10[rip]
	call	PrintError@PLT
	jmp	.L7
.L17:
	call	clock@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	mov	rbx, rax
	jmp	.L19
.L23:
	mov	rsi, r14
	lea	rdi, .LC6[rip]
	call	PrintError@PLT
	jmp	.L7
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	-4194304
	.long	1105199103
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC9:
	.long	0
	.long	-1074790400
