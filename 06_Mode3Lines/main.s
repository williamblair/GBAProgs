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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mov	r2, #1024
	sub	fp, ip, #4
	add	r2, r2, #3
	mov	r3, #67108864
	sub	sp, sp, #12
	str	r2, [r3, #0]
	mov	r2, #0
	mov	r1, #0
	sub	r3, fp, #48
	mov	sl, #-2080374781
	stmia	r3, {r1-r2}	@  x
	add	sl, sl, #2162688
	ldr	r7, .L20
	add	sl, sl, #2112
.L19:
	mov	lr, pc
	bx	r7
	ldr	r4, .L20+4
	smull	r1, r2, r4, r0	@  x
	mov	r3, r0, asr #31	@  x
	add	r2, r2, r0	@  x
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4	@  x
	str	r0, [fp, #-48]	@  x
	mov	lr, pc
	bx	r7
	ldr	r3, .L20+8
	smull	r4, r2, r3, r0	@  x
	mov	r3, r0, asr #31	@  x
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #2
	sub	r8, r0, r3, asl #5	@  y,  x
	mov	lr, pc
	bx	r7
	ldr	r1, .L20+4
	smull	r3, r2, r1, r0	@  x
	mov	r3, r0, asr #31	@  x
	add	r2, r2, r0	@  x
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r5, r0, r3, asl #4	@  x,  x
	mov	lr, pc
	bx	r7
	ldr	r4, .L20+8
	smull	r1, r2, r4, r0	@  x
	mov	r3, r0, asr #31	@  x
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #2
	sub	r6, r0, r3, asl #5	@  y,  x
	mov	lr, pc
	bx	r7
	smull	r3, r2, sl, r0	@  x
	mov	r3, r0, asr #31	@  x
	add	r2, r2, r0	@  x
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r4, r3, r0	@  x
	mov	lr, pc
	bx	r7
	smull	r1, r2, sl, r0	@  x
	mov	r3, r0, asr #31	@  x
	add	r2, r2, r0	@  x
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0	@  x
	orr	r4, r4, r0, asl #5
	mov	lr, pc
	bx	r7
	smull	r3, r2, sl, r0	@  x
	mov	r3, r0, asr #31	@  x
	add	r2, r2, r0	@  x
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0	@  x
	orr	r4, r4, r0, asl #10
	mov	r4, r4, asl #16
	mov	r4, r4, lsr #16
	mov	r2, r5	@  x
	mov	r3, r6	@  y
	ldr	r0, [fp, #-48]	@  x
	mov	r1, r8	@  y
	str	r5, [fp, #-44]	@  x,  x
	str	r4, [sp, #0]
	bl	DrawLine3
	b	.L19
.L21:
	.align	2
.L20:
	.word	rand
	.word	-2004318071
	.word	1717986919
	.size	main, .-main
	.align	2
	.type	DrawLine3, %function
DrawLine3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	sl, r3	@  y2
	sub	sp, sp, #12
	rsb	r3, r0, r2	@  x1,  x2
	mov	r7, r2	@  x2
	rsb	r2, r1, sl	@  y1,  y2
	eor	lr, r3, r3, asr #31	@  dX
	sub	lr, lr, r3, asr #31	@  dX
	eor	ip, r2, r2, asr #31	@  dY
	sub	ip, ip, r2, asr #31	@  dY
	ldrsh	r3, [sp, #44]	@  color
	cmp	lr, ip	@  dX,  dY
	str	r3, [sp, #8]	@  color
	blt	.L2
	mov	r5, #1	@  xInc2
	rsb	r2, lr, ip	@  dX,  dY
	mov	r3, ip, asl #1	@  dInc1,  dY
	mov	r6, r2, asl r5	@  dInc2
	add	r4, lr, r5	@  numPixels,  dX
	rsb	r2, lr, r3	@  d,  dX,  dInc1
	mov	r9, #0	@  yInc1
	str	r3, [sp, #4]	@  dInc1,  dInc1
	str	r5, [sp, #0]	@  xInc2,  xInc1
.L26:
	cmp	r0, r7	@  x1,  x2
	ldrgt	r3, [sp, #0]	@  xInc1
	rsbgt	r3, r3, #0
	mov	r8, r5	@  yInc2,  xInc2
	strgt	r3, [sp, #0]	@  xInc1
	mvngt	r5, #0	@  xInc2
	cmp	r1, sl	@  y1,  y2
	rsbgt	r9, r9, #0	@  yInc1,  yInc1
	mvngt	r8, #0	@  yInc2
	cmp	r4, #1	@  numPixels
	ble	.L25
	ldr	ip, [sp, #8]	@  color
	mov	r3, ip, asl #16
	mov	lr, r3, lsr #16	@  color
	sub	ip, r4, #1	@  i,  numPixels
.L13:
	rsb	r3, r1, r1, asl #4	@  y,  y
	add	r3, r0, r3, asl #4	@  x
	mov	r3, r3, asl #1
	cmp	r2, #0	@  d
	add	r3, r3, #100663296
	strh	lr, [r3, #0]	@ movhi 	@  color
	ldrlt	r3, [sp, #4]	@  dInc1
	addlt	r2, r2, r3	@  d,  d
	ldrlt	r3, [sp, #0]	@  xInc1
	addlt	r1, r1, r9	@  y,  y,  yInc1
	addlt	r0, r0, r3	@  x,  x
	addge	r2, r2, r6	@  d,  d,  dInc2
	addge	r0, r0, r5	@  x,  x,  xInc2
	addge	r1, r1, r8	@  y,  y,  yInc2
	subs	ip, ip, #1	@  i,  i
	bne	.L13
.L25:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L2:
	rsb	r2, ip, lr	@  dY,  dX
	mov	r5, #1	@  xInc2
	mov	r3, lr, asl #1	@  dInc1,  dX
	mov	r6, r2, asl r5	@  dInc2
	add	r4, ip, r5	@  numPixels,  dY
	rsb	r2, ip, r3	@  d,  dY,  dInc1
	mov	ip, #0
	str	r3, [sp, #4]	@  dInc1,  dInc1
	str	ip, [sp, #0]	@  xInc1
	mov	r9, r5	@  yInc1,  xInc2
	b	.L26
	.size	DrawLine3, .-DrawLine3
	.ident	"GCC: (GNU) 3.3.2"
