	.file	"arccos.c"
	.intel_syntax noprefix
	.text
	.globl	ArcCos
	.type	ArcCos, @function
ArcCos:
	endbr64
	movaps	xmm8, xmm0
	xor	eax, eax
	xorps	xmm2, xmm2
	movsd	xmm9, QWORD PTR .LC1[rip]
	mulsd	xmm8, xmm0
	movsd	xmm6, QWORD PTR .LC2[rip]
	movq	xmm5, QWORD PTR .LC3[rip]
	movsd	xmm4, QWORD PTR .LC4[rip]
.L2:
	cvtsi2sd	xmm1, eax
	addsd	xmm2, xmm0
	mulsd	xmm0, xmm8
	inc	eax
	cvtsi2sd	xmm7, eax
	movaps	xmm3, xmm1
	addsd	xmm1, xmm6
	addsd	xmm3, xmm9
	mulsd	xmm0, xmm3
	divsd	xmm0, xmm7
	mulsd	xmm0, xmm3
	divsd	xmm0, xmm1
	movaps	xmm1, xmm0
	andps	xmm1, xmm5
	comisd	xmm1, xmm4
	ja	.L2
	movsd	xmm0, QWORD PTR .LC5[rip]
	subsd	xmm0, xmm2
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
