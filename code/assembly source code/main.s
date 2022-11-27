	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
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
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov		rbp, rsp
	sub		rsp, 112
	mov		DWORD PTR -100[rbp], edi
	mov		QWORD PTR -112[rbp], rsi
	mov		QWORD PTR -8[rbp], 0			# char *inName = NULL;
	mov		QWORD PTR -16[rbp], 0			# char *outName = NULL;
	mov		DWORD PTR -24[rbp], 0			# int com = 0;
	mov		BYTE PTR -17[rbp], 0			# bool isRand = false;
	jmp		.L2								# while
.L7:
	cmp		DWORD PTR -24[rbp], 103			# if (com == 'g')
	jne		.L3								
	mov		BYTE PTR -17[rbp], 1			# isRand = true;
	jmp		.L2								
.L3:
	cmp		DWORD PTR -24[rbp], 105			# else if (com == 'i')
	jne		.L4
	mov		rax, QWORD PTR optarg[rip]
	mov		QWORD PTR -8[rbp], rax			# inName = optarg;
	jmp		.L2
.L4:
	cmp		DWORD PTR -24[rbp], 111			# else if (com == 'o')
	jne		.L5
	mov		rax, QWORD PTR optarg[rip]
	mov		QWORD PTR -16[rbp], rax			# outName = optarg;
	jmp		.L2
.L5:
	lea		rsi, .LC0[rip]
	lea		rdi, .LC1[rip]
	call	PrintError@PLT					# PrintError("The option is not correct!", "output.txt");
	mov		eax, 0
	jmp		.L6								# return 0;
.L2:
	mov		rcx, QWORD PTR -112[rbp]
	mov		eax, DWORD PTR -100[rbp]
	lea		rdx, .LC2[rip]
	mov		rsi, rcx
	mov		edi, eax
	call	getopt@PLT
	mov		DWORD PTR -24[rbp], eax
	cmp		DWORD PTR -24[rbp], -1			# while ((com = getopt(argc, argv, "i:o:g")) != -1)
	jne		.L7
	cmp		BYTE PTR -17[rbp], 0			# if (isRand)
	je		.L8
	mov		edi, 0
	call	time@PLT						# time(NULL);
	mov		edi, eax
	call	srand@PLT						# srand(time(NULL));
	call	rand@PLT						# rand();
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC3[rip]
	divsd	xmm0, xmm1
	addsd	xmm0, xmm0
	movsd	xmm1, QWORD PTR .LC4[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0		# double x = (double)rand() / RAND_MAX * 2.0 - 1.0;
	call	clock@PLT
	mov		QWORD PTR -72[rbp], rax			# clock_t start = clock();
	mov		rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	call	ArcCos@PLT
	movq	rax, xmm0
	mov		QWORD PTR -80[rbp], rax			# double res = ArcCos(x);
	call	clock@PLT
	mov		QWORD PTR -88[rbp], rax			# clock_t end = clock();
	mov		rax, QWORD PTR -88[rbp]
	sub		rax, QWORD PTR -72[rbp]
	mov		rcx, rax
	mov		rdx, QWORD PTR -80[rbp]
	mov		rax, QWORD PTR -16[rbp]
	mov		rsi, rcx
	movq	xmm0, rdx
	mov		rdi, rax
	call	PrintResult@PLT					# PrintResult(outName, result, end - start);
	jmp		.L9								# goto line №68, return 0;
.L8:
	mov		rax, QWORD PTR -8[rbp]
	lea		rsi, .LC5[rip]
	mov		rdi, rax
	call	fopen@PLT
	mov		QWORD PTR -32[rbp], rax			# FILE *in = fopen(inName, "r");
	cmp		QWORD PTR -32[rbp], 0			# if (in == NULL)
	jne		.L10
	mov		rax, QWORD PTR -16[rbp]
	mov		rsi, rax
	lea		rdi, .LC6[rip]
	call	PrintError@PLT					# PrintError("Input file does not exist!", outName);
	mov		eax, 0							
	jmp		.L6								# return 0;
.L10:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -96[rbp], xmm0		# double x = 0;
	lea		rdx, -96[rbp]
	mov		rax, QWORD PTR -32[rbp]
	lea		rsi, .LC8[rip]
	mov		rdi, rax
	mov		eax, 0
	call	__isoc99_fscanf@PLT				# fscanf(in, "%lf", &x);
	mov		rax, QWORD PTR -32[rbp]
	mov		rdi, rax
	call	fclose@PLT						# fclose(in);
	movsd	xmm1, QWORD PTR -96[rbp]
	movsd	xmm0, QWORD PTR .LC9[rip]
	comisd	xmm0, xmm1
	ja		.L12
	movsd	xmm0, QWORD PTR -96[rbp]
	movsd	xmm1, QWORD PTR .LC4[rip]
	comisd	xmm0, xmm1
	jbe		.L15							# if (x < -1 || x > 1)
.L12:
	mov		rax, QWORD PTR -16[rbp]
	mov		rsi, rax
	lea		rdi, .LC10[rip]
	call	PrintError@PLT					# PrintError("Invalid value! [-1 <= x <= 1]", outName);
	mov		eax, 0
	jmp		.L6								# return 0;
.L15:
	call	clock@PLT
	mov		QWORD PTR -40[rbp], rax			# clock_t start = clock();
	mov		rax, QWORD PTR -96[rbp]
	movq	xmm0, rax
	call	ArcCos@PLT
	movq	rax, xmm0
	mov		QWORD PTR -48[rbp], rax			# double res = ArcCos(x);
	call	clock@PLT
	mov		QWORD PTR -56[rbp], rax			# clock_t end = clock();
	mov		rax, QWORD PTR -56[rbp]
	sub		rax, QWORD PTR -40[rbp]
	mov		rcx, rax
	mov		rdx, QWORD PTR -48[rbp]
	mov		rax, QWORD PTR -16[rbp]
	mov		rsi, rcx
	movq	xmm0, rdx
	mov		rdi, rax
	call	PrintResult@PLT					# PrintResult(outName, res, end - start);
.L9:
	mov		eax, 0							# return 0;
.L6:
	leave
	ret										# }
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	4290772992
	.long	1105199103
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC9:
	.long	0
	.long	-1074790400
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
