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

	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	mov	r2, #1024
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	add	r2, r2, #4
	mov	r7, #-2080374781
	mov	r3, #67108864
	mov	r8, #83886080	@  paletteMem
	mov	r1, #0	@ movhi
	add	r7, r7, #2162688
	str	r2, [r3, #0]
	ldr	r6, .L25
	strh	r1, [r8, #0]	@ movhi 	@ * paletteMem
	sub	fp, ip, #4
	mov	r5, #1	@  i
	add	r7, r7, #2112
.L7:
	mov	lr, pc
	bx	r6
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r4, r3, r0
	mov	lr, pc
	bx	r6
	smull	r1, r2, r7, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0
	orr	r4, r4, r0, asl #5
	mov	lr, pc
	bx	r6
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	mov	r2, r5, asl #1	@  i
	rsb	r0, r3, r0
	add	r5, r5, #1	@  i,  i
	orr	r4, r4, r0, asl #10
	cmp	r5, #255	@  i
	strh	r4, [r2, r8]	@ movhi 	@ * paletteMem
	ble	.L7
.L21:
	mov	lr, pc
	bx	r6
	ldr	r2, .L25+4
	smull	r1, r3, r2, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r5, r2, r3, asr #7	@  x
	rsb	r1, r5, r5, asl #4	@  x,  x
	sub	r5, r0, r1, asl #4	@  x
	mov	lr, pc
	bx	r6
	ldr	r3, .L25+8
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r4, r2, r1, asr #6	@  y
	add	r3, r4, r4, asl #2	@  y,  y
	sub	r4, r0, r3, asl #5	@  y
	mov	lr, pc
	bx	r6
	rsb	r2, r4, r4, asl #4	@  y,  y
	mov	r3, r0, asr #31
	add	r3, r0, r3, lsr #24
	add	r2, r5, r2, asl #4	@  x
	bic	ip, r2, #1
	bic	r3, r3, #255
	rsb	r0, r3, r0
	add	r3, ip, #100663296
	ldrsh	r2, [r3, #0]	@  curVal
	and	r0, r0, #255	@  color
	and	r1, r2, #65280	@  curVal
	and	r2, r2, #255	@  curVal
	orr	r1, r1, r0	@  color
	orr	r2, r2, r0, asl #8	@  color
	tst	r5, #1	@  x
	mov	r1, r1, asl #16
	mov	r2, r2, asl #16
	mov	r1, r1, asr #16	@  newVal
	add	r3, ip, #100663296
	moveq	r1, r2, asr #16	@  newVal
	strh	r1, [r3, #0]	@ movhi 	@  newVal
	b	.L21
.L26:
	.align	2
.L25:
	.word	rand
	.word	-2004318071
	.word	1717986919
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
