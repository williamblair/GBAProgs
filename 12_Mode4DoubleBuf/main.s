	.file	"main.c"
@ GNU C version 3.3.2 (arm-thumb-elf)
@	compiled by GNU C version 3.3.1 (cygming special).
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -fpreprocessed -mthumb-interwork -mlong-calls
@ -auxbase-strip -O2 -Wall -fverbose-asm
@ options enabled:  -fdefer-pop -fomit-frame-pointer
@ -foptimize-sibling-calls -fcse-follow-jumps -fcse-skip-blocks
@ -fexpensive-optimizations -fthread-jumps -fstrength-reduce -fpeephole
@ -fforce-mem -ffunction-cse -fkeep-static-consts -fcaller-saves
@ -freg-struct-return -fgcse -fgcse-lm -fgcse-sm -floop-optimize
@ -fcrossjumping -fif-conversion -fif-conversion2 -frerun-cse-after-loop
@ -frerun-loop-opt -fdelete-null-pointer-checks -fschedule-insns
@ -fschedule-insns2 -fsched-interblock -fsched-spec -fbranch-count-reg
@ -freorder-blocks -freorder-functions -fcprop-registers -fcommon
@ -fverbose-asm -fgnu-linker -fregmove -foptimize-register-move
@ -fargument-alias -fstrict-aliasing -fmerge-constants
@ -fzero-initialized-in-bss -fident -fpeephole2 -fguess-branch-probability
@ -fmath-errno -ftrapping-math -mapcs -mapcs-frame -mapcs-32 -msoft-float
@ -mthumb-interwork -mlong-calls

	.global	videoMem
	.data
	.align	2
	.type	videoMem, %object
	.size	videoMem, 4
videoMem:
	.word	100663296
	.global	scanlineCounter
	.align	2
	.type	scanlineCounter, %object
	.size	scanlineCounter, 4
scanlineCounter:
	.word	67108870
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 512
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #512
	sub	r4, fp, #540	@  palette
	mov	r0, r4	@  palette
	mov	r1, #0
	mov	r2, #256
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	add	r2, r2, #4
	mov	r3, #67108864
	mvn	r1, #508
	str	r2, [r3, #0]
	sub	r1, r1, #1
	sub	r2, fp, #28
	mov	r3, #992	@ movhi
	mov	r0, #-2130706432
	strh	r3, [r2, r1]	@ movhi 	@  palette
	mov	r0, r0, asr #22
	mov	r2, #31	@ movhi
	sub	r1, fp, #28
	mov	ip, #83886080	@  paletteMem
	strh	r2, [r1, r0]	@ movhi 	@  palette
	mov	r2, #0	@  i
.L13:
	mov	r3, r2, asl #1	@  i
	ldrh	r1, [r3, r4]	@ movhi	@ * palette
	add	r2, r2, #1	@  i,  i
	cmp	r2, #255	@  i
	strh	r1, [r3, ip]	@ movhi 	@ * paletteMem
	ble	.L13
	mov	r1, #67108864
	ldr	r2, [r1, #0]
	tst	r2, #16
	beq	.L15
	ldr	r6, .L77+4
	mov	r3, #100663296
	bic	r2, r2, #16
	add	r3, r3, #40960
	str	r2, [r1, #0]
	str	r3, [r6, #0]	@  videoMem
.L17:
	ldr	r5, [r6, #0]	@  videoMem
	mov	r7, #20	@  x
.L30:
	and	r4, r7, #1	@  x
	add	r1, r7, #4800	@  x
	mov	lr, #49	@  curY
.L29:
	bic	ip, r1, #1
	ldrsh	r3, [ip, r5]	@  curVal
	and	r2, r3, #65280	@  curVal
	orr	r2, r2, #1
	and	r3, r3, #255	@  curVal
	orr	r0, r3, #256	@  newVal
	cmp	r4, #0
	mov	r2, r2, asl #16
	ldr	r3, [r6, #0]	@  videoMem
	moveq	r0, r2, asr #16	@  newVal
	subs	lr, lr, #1	@  curY,  curY
	add	r1, r1, #240
	strh	r0, [ip, r3]	@ movhi 	@  newVal
	bpl	.L29
	add	r7, r7, #1	@  x,  x
	cmp	r7, #70	@  x
	blt	.L30
	mov	r1, #67108864
	ldr	r2, [r1, #0]
	tst	r2, #16
	movne	r3, #100663296
	orreq	r3, r2, #16
	addne	r3, r3, #40960
	moveq	r2, #100663296
	strne	r3, [r6, #0]	@  videoMem
	streq	r2, [r6, #0]	@  videoMem
	bicne	r2, r2, #16
	strne	r2, [r1, #0]
	streq	r3, [r1, #0]
	ldr	r5, [r6, #0]	@  videoMem
	mov	r7, #70	@  x
.L47:
	and	r4, r7, #1	@  x
	add	r1, r7, #4800	@  x
	mov	lr, #49	@  curY
.L46:
	bic	ip, r1, #1
	ldrsh	r3, [ip, r5]	@  curVal
	and	r2, r3, #65280	@  curVal
	orr	r2, r2, #2
	and	r3, r3, #255	@  curVal
	orr	r0, r3, #512	@  newVal
	cmp	r4, #0
	mov	r2, r2, asl #16
	ldr	r3, [r6, #0]	@  videoMem
	moveq	r0, r2, asr #16	@  newVal
	subs	lr, lr, #1	@  curY,  curY
	add	r1, r1, #240
	strh	r0, [ip, r3]	@ movhi 	@  newVal
	bpl	.L46
	add	r7, r7, #1	@  x,  x
	cmp	r7, #120	@  x
	blt	.L47
	ldr	r3, .L77+8
	mov	r1, #100663296
	ldr	r0, [r3, #0]	@  scanlineCounter
	add	r1, r1, #40960
.L76:
	ldrh	r3, [r0, #0]
	cmp	r3, #159
	bls	.L76
	mov	r2, #67108864
	ldr	r3, [r2, #0]
	tst	r3, #16
	orreq	r3, r3, #16
	bicne	r3, r3, #16
	streq	r3, [r2, #0]
	moveq	r2, #100663296
	strne	r3, [r2, #0]
	strne	r1, [r6, #0]	@  videoMem
	mov	r3, #499712	@  n
	streq	r2, [r6, #0]	@  videoMem
	add	r3, r3, #288	@  n,  n
.L62:
	sub	r3, r3, #1	@  n,  n
	cmp	r3, #0	@  n
	bgt	.L62
	b	.L76
.L15:
	ldr	r6, .L77+4
	orr	r3, r2, #16
	mov	r2, #100663296
	str	r3, [r1, #0]
	str	r2, [r6, #0]	@  videoMem
	b	.L17
.L78:
	.align	2
.L77:
	.word	memset
	.word	videoMem
	.word	scanlineCounter
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
