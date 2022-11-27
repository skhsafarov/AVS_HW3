	.file	"print.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"w"
.LC2:
	.string	"%lf\nELAPSED TIME: %lf s.\n"
	.text
	.globl	PrintResult
	.type	PrintResult, @function
PrintResult:
	endbr64
	push	rbp								# стандартный пролог
	mov		rbp, rsp						# стандартный пролог
	sub		rsp, 48
	mov		QWORD PTR -24[rbp], rdi			# char *outName;
	movsd	QWORD PTR -32[rbp], xmm0		# double res;
	mov		QWORD PTR -40[rbp], rsi			# clock_t diff
	mov		rax, QWORD PTR -24[rbp]
	lea		rsi, .LC0[rip]
	mov		rdi, rax
	call	fopen@PLT
	mov		QWORD PTR -8[rbp], rax			# FILE *out = fopen(outName, "w");	
	cvtsi2sd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	mov		rdx, QWORD PTR -32[rbp]
	mov		rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rdx
	lea		rsi, .LC2[rip]
	mov		rdi, rax
	mov		eax, 2
	call	fprintf@PLT						# fprintf(out, "%lf\nELAPSED TIME: %lf s.\n", res, (double)(diff) / CLOCKS_PER_SEC);
	mov		rax, QWORD PTR -8[rbp]
	mov		rdi, rax
	call	fclose@PLT						# fclose(out);
	nop
	leave									# стандартный эпилог
	ret										# возврат из функции, в eax
	.size	PrintResult, .-PrintResult
	.section	.rodata
.LC3:
	.string	"%s\n"
	.text
	.globl	PrintError
	.type	PrintError, @function
PrintError:
	endbr64
	push	rbp								# стандартный пролог
	mov		rbp, rsp						# стандартный пролог
	sub		rsp, 32
	mov		QWORD PTR -24[rbp], rdi			# char *mess;
	mov		QWORD PTR -32[rbp], rsi			# char *outName;
	mov		rax, QWORD PTR -32[rbp]
	lea		rsi, .LC0[rip]
	mov		rdi, rax
	call	fopen@PLT						# fopen(outName, "w");
	mov		QWORD PTR -8[rbp], rax			# FILE *out = fopen(outName, "w");
	mov		rdx, QWORD PTR -24[rbp]
	mov		rax, QWORD PTR -8[rbp]
	lea		rsi, .LC3[rip]
	mov		rdi, rax
	mov		eax, 0
	call	fprintf@PLT						# fprintf(out, "%s\n", mess);
	mov		rax, QWORD PTR -8[rbp]
	mov		rdi, rax
	call	fclose@PLT						# fclose(out);
	nop
	leave									# стандартный эпилог
	ret										# возврат из функции, в eax
	.size	PrintError, .-PrintError
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1093567616
