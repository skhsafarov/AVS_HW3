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
.LC10:
	.string	"Invalid value! [-1 <= x <= 1]"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	lea	r15, .LC2[rip]
	push	r14
	xor	r14d, r14d
	push	r13
	xor	r13d, r13d
	push	r12
	mov	r12, rsi
	push	rbp
	xor	ebp, ebp
	push	rbx
	mov	ebx, edi
	sub	rsp, 40
.L2:
	mov	rdx, r15
	mov	rsi, r12
	mov	edi, ebx
	call	getopt@PLT
	cmp	eax, -1
	je	.L22
	cmp	eax, 105
	je	.L3
	cmp	eax, 111
	je	.L4
	cmp	eax, 103
	je	.L23
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	jmp	.L20
.L3:
	mov	r13, QWORD PTR optarg[rip]
	jmp	.L2
.L4:
	mov	rbp, QWORD PTR optarg[rip]
	jmp	.L2
.L23:
	mov	r14b, 1
	jmp	.L2
.L22:
	test	r14b, r14b
	je	.L9
	xor	edi, edi
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	mov	ebx, eax
	call	clock@PLT
	cvtsi2sd	xmm0, ebx
	divsd	xmm0, QWORD PTR .LC3[rip]
	addsd	xmm0, xmm0
	mov	r12, rax
	subsd	xmm0, QWORD PTR .LC4[rip]
	jmp	.L19
.L9:
	lea	rsi, .LC5[rip]
	mov	rdi, r13
	call	fopen@PLT
	mov	rsi, rbp
	lea	rdi, .LC6[rip]
	mov	r12, rax
	test	rax, rax
	je	.L20
	mov	rdi, rax
	lea	rdx, 24[rsp]
	xor	eax, eax
	mov	QWORD PTR 24[rsp], 0x000000000
	lea	rsi, .LC8[rip]
	call	__isoc99_fscanf@PLT
	mov	rdi, r12
	call	fclose@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	movsd	xmm1, QWORD PTR .LC9[rip]
	comisd	xmm1, xmm0
	ja	.L12
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L17
.L12:
	mov	rsi, rbp
	lea	rdi, .LC10[rip]
.L20:
	call	PrintError@PLT
	jmp	.L7
.L17:
	call	clock@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	mov	r12, rax
.L19:
	call	ArcCos@PLT
	movsd	QWORD PTR 8[rsp], xmm0
	call	clock@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rdi, rbp
	sub	rax, r12
	mov	rsi, rax
	call	PrintResult@PLT
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
