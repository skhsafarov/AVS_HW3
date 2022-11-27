	.file	"arccos.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	ArcCos
	.type	ArcCos, @function
ArcCos:
	endbr64
	movapd	xmm9, xmm0
	pxor	xmm4, xmm4
	movsd	xmm8, QWORD PTR .LC1[rip]
	movsd	xmm7, QWORD PTR .LC2[rip]
	mulsd	xmm9, xmm0
	movq	xmm6, QWORD PTR .LC3[rip]
	xor	eax, eax
	movapd	xmm2, xmm4
	movsd	xmm5, QWORD PTR .LC4[rip]
	.p2align 4,,10
	.p2align 3
.L2:
	addsd	xmm4, xmm0
	mulsd	xmm0, xmm9
	movapd	xmm3, xmm2
	add	eax, 1
	addsd	xmm3, xmm8
	movapd	xmm1, xmm2
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	addsd	xmm1, xmm7
	mulsd	xmm0, xmm3
	divsd	xmm0, xmm2
	mulsd	xmm0, xmm3
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	andpd	xmm1, xmm6
	comisd	xmm1, xmm5
	ja	.L2
	movsd	xmm0, QWORD PTR .LC5[rip]
	subsd	xmm0, xmm4
	ret
	.size	ArcCos, .-ArcCos
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC2:
	.long	0
	.long	1073217536
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	1749644930
	.long	1027352002
	.align 8
.LC5:
	.long	1413754136
	.long	1073291771
