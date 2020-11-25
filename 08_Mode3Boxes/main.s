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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	add	r2, r2, #3
	mov	r9, #-2080374781
	mov	r3, #67108864
	add	r9, r9, #2162688
	str	r2, [r3, #0]
	ldr	sl, .L24
	sub	fp, ip, #4
	add	r9, r9, #2112
.L23:
	mov	lr, pc
	bx	sl
	ldr	r2, .L24+4
	smull	r1, r3, r2, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r8, r2, r3, asr #7	@  x
	rsb	r1, r8, r8, asl #4	@  x,  x
	sub	r8, r0, r1, asl #4	@  x
	mov	lr, pc
	bx	sl
	ldr	r3, .L24+8
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r5, r2, r1, asr #6	@  y
	add	r3, r5, r5, asl #2	@  y,  y
	sub	r5, r0, r3, asl #5	@  y
	mov	lr, pc
	bx	sl
	ldr	r3, .L24+12
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r7, r2, r1, asr #3	@  width
	add	r3, r7, r7, asl #2	@  width,  width
	rsb	r3, r3, r3, asl #4
	rsb	r7, r3, r0	@  width
	mov	lr, pc
	bx	sl
	ldr	r3, .L24+12
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r6, r2, r1, asr #3	@  height
	add	r3, r6, r6, asl #2	@  height,  height
	rsb	r3, r3, r3, asl #4
	rsb	r6, r3, r0	@  height
	mov	lr, pc
	bx	sl
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r4, r3, r0
	mov	lr, pc
	bx	sl
	smull	r1, r2, r9, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0
	orr	r4, r4, r0, asl #5
	mov	lr, pc
	bx	sl
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0
	orr	r4, r4, r0, asl #10
	add	lr, r8, r7	@  endX,  x,  width
	mov	r4, r4, asl #16
	cmp	r8, lr	@  x,  endX
	mov	ip, r8	@  x,  x
	mov	r4, r4, lsr #16	@  color
	add	r0, r5, r6	@  endY,  y,  height
	bge	.L23
	rsb	r3, r5, r5, asl #4	@  y,  y
	mov	r4, r4, asl #16	@  color
	mov	r6, r3, asl #4
.L16:
	cmp	r5, r0	@  curY,  endY
	bge	.L22
	add	r3, r6, ip	@  x
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	mov	r1, r4, lsr #16	@  color
	rsb	r2, r5, r0	@  curY,  curY,  endY
.L15:
	subs	r2, r2, #1	@  curY,  curY
	strh	r1, [r3, #0]	@ movhi 	@  color
	add	r3, r3, #480
	bne	.L15
.L22:
	add	ip, ip, #1	@  x,  x
	cmp	ip, lr	@  x,  endX
	blt	.L16
	b	.L23
.L25:
	.align	2
.L24:
	.word	rand
	.word	-2004318071
	.word	1717986919
	.word	458129845
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
