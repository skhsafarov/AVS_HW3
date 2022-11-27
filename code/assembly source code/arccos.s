	.file	"arccos.c"
	.intel_syntax noprefix
	.text
	.globl	ArcCos
	.type	ArcCos, @function
ArcCos:
	endbr64
	push	rbp							# стандартный пролог
	mov	rbp, rsp						# стандартный пролог
	movsd	QWORD PTR -40[rbp], xmm0	# double x
	mov	DWORD PTR -4[rbp], 0			# int n = 0;
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0	# double res = 0;
	movsd	xmm0, QWORD PTR -40[rbp]
	mulsd	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0	# double y = x * x;
.L2:									# do
	movsd	xmm0, QWORD PTR -16[rbp]	
	addsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR -16[rbp], xmm0	# res += x;
	movsd	xmm0, QWORD PTR -40[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR -24[rbp]	# x * y
	cvtsi2sd	xmm2, DWORD PTR -4[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm2					# n + 0.5
	mulsd	xmm0, xmm1					# x * y * (n + 0.5)
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 1							# n + 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1					# x * y * (n + 0.5) / (n + 1)
	movapd	xmm1, xmm0
	cvtsi2sd	xmm2, DWORD PTR -4[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm2					# n + 0.5
	mulsd	xmm0, xmm1					# x * y * (n + 0.5) / (n + 1) * (n + 0.5)
	cvtsi2sd	xmm2, DWORD PTR -4[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	addsd	xmm1, xmm2					# n + 1.5
	divsd	xmm0, xmm1					# x * y * (n + 0.5) / (n + 1) * (n + 0.5) / (n + 1.5);
	movsd	QWORD PTR -40[rbp], xmm0	# x = x * y * (n + 0.5) / (n + 1) * (n + 0.5) / (n + 1.5);
	add	DWORD PTR -4[rbp], 1			# ++n;
	movsd	xmm0, QWORD PTR -40[rbp]
	movq	xmm1, QWORD PTR .LC3[rip]
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR .LC4[rip]	# while (fabs(x) > 0.0000000000001);
	ja	.L2								# goto do
	movsd	xmm0, QWORD PTR .LC5[rip]
	subsd	xmm0, QWORD PTR -16[rbp]
	pop	rbp								# стандартный эпилог
	ret									# возврат результата в eax
	.size	ArcCos, .-ArcCos
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC2:
	.long	0
	.long	1073217536
	.align 16
.LC3:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC4:
	.long	1749644930
	.long	1027352002
	.align 8
.LC5:
	.long	1413754136
	.long	1073291771
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
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
