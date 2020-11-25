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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mov	r0, #-2080374781
	mov	r2, #1024
	add	r0, r0, #2162688
	sub	fp, ip, #4
	sub	sp, sp, #32
	add	r2, r2, #3
	mov	r3, #67108864
	add	r0, r0, #2112
	str	r2, [r3, #0]
	str	r0, [fp, #-48]
.L24:
	ldr	r1, .L26
	mov	lr, pc
	bx	r1
	ldr	r2, .L26+4
	smull	r1, r3, r2, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r1, r3, r3, asl #4
	sub	r0, r0, r1, asl #4
	ldr	r2, .L26
	str	r0, [fp, #-44]	@  x
	mov	lr, pc
	bx	r2
	ldr	r3, .L26+8
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r6, r2, r1, asr #6	@  y
	add	r3, r6, r6, asl #2	@  y,  y
	sub	r6, r0, r3, asl #5	@  y
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+12
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r5, r2, r1, asr #4	@  radius
	add	r3, r5, r5, asl #2	@  radius,  radius
	add	r3, r3, r3, asl #2
	sub	r5, r0, r3, asl #1	@  radius
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	mov	r4, r0
	ldr	r0, [fp, #-48]
	smull	r1, r2, r0, r4
	mov	r3, r4, asr #31
	add	r2, r2, r4
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	ldr	r2, .L26
	rsb	r4, r3, r4
	mov	lr, pc
	bx	r2
	ldr	r3, [fp, #-48]
	smull	r1, r2, r3, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0
	ldr	r2, .L26
	orr	r4, r4, r0, asl #5
	mov	lr, pc
	bx	r2
	ldr	r3, [fp, #-48]
	smull	r1, r2, r3, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0
	mov	r2, #0
	orr	r4, r4, r0, asl #10
	mov	r4, r4, asl #16
	mov	r3, r5, asl #1	@  curY
	cmp	r2, r5	@  curY
	mov	r8, r5	@  curY,  radius
	str	r2, [fp, #-52]	@  curX
	mov	r4, r4, lsr #16	@  color
	rsb	r9, r3, #3	@  p
	bgt	.L24
	rsb	r1, r6, r6, asl #4	@  y,  y
	add	r2, r5, r6	@  curY,  y
	rsb	r3, r5, r5, asl #24	@  curY,  curY
	mov	r1, r1, asl #4
	add	r3, r5, r3, asl #4	@  curY
	rsb	r2, r2, r2, asl #4
	add	r3, r1, r3, asl #4
	mov	r2, r2, asl #4
	str	r3, [fp, #-60]
	str	r2, [fp, #-64]
	str	r1, [fp, #-68]
	mov	sl, r1
	mov	r7, r4	@  color,  color
.L19:
	ldr	r3, [fp, #-44]	@  x
	ldr	r0, [fp, #-52]	@  curX
	rsb	ip, r8, r3	@  x,  curY
	add	r2, r3, r0	@  x
	rsb	r1, r0, r3	@  x
	add	r0, r3, r8	@  x,  curY
	ldr	r3, [fp, #-60]
	add	lr, r3, r2	@  x
	add	r4, r3, r1	@  x
	ldr	r3, [fp, #-68]
	add	r5, sl, r0	@  x
	add	r6, sl, ip	@  x
	add	r0, r3, r0	@  x
	add	ip, r3, ip	@  x
	ldr	r3, [fp, #-64]
	add	r2, r3, r2	@  x
	add	r1, r3, r1	@  x
	ldr	r3, [fp, #-52]	@  curX
	rsb	r3, r8, r3	@  curY
	add	r3, r9, r3, asl #2	@  p
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-52]	@  curX
	mov	r2, r2, asl #1
	mov	r1, r1, asl #1
	mov	lr, lr, asl #1
	mov	r4, r4, asl #1
	mov	r0, r0, asl #1
	mov	ip, ip, asl #1
	mov	r5, r5, asl #1
	mov	r6, r6, asl #1
	add	r3, r9, r3, asl #2	@  p
	add	r2, r2, #100663296
	add	r1, r1, #100663296
	add	lr, lr, #100663296
	add	r4, r4, #100663296
	add	r0, r0, #100663296
	add	ip, ip, #100663296
	add	r5, r5, #100663296
	add	r6, r6, #100663296
	cmp	r9, #0	@  p
	strh	r7, [r2, #0]	@ movhi 	@  color
	str	r3, [fp, #-56]
	strh	r7, [r1, #0]	@ movhi 	@  color
	strh	r7, [lr, #0]	@ movhi 	@  color
	strh	r7, [r4, #0]	@ movhi 	@  color
	strh	r7, [r0, #0]	@ movhi 	@  color
	strh	r7, [ip, #0]	@ movhi 	@  color
	strh	r7, [r5, #0]	@ movhi 	@  color
	strh	r7, [r6, #0]	@ movhi 	@  color
	blt	.L25
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-64]
	ldr	r0, [fp, #-60]
	ldr	r1, [fp, #-68]
	add	r9, r2, #10	@  p
	ldr	r2, [fp, #-52]	@  curX
	sub	r3, r3, #240
	add	r0, r0, #240
	add	r1, r1, #240
	add	r2, r2, #1
	str	r3, [fp, #-64]
	str	r0, [fp, #-60]
	str	r1, [fp, #-68]
	str	r2, [fp, #-52]	@  curX
	sub	sl, sl, #240
	sub	r8, r8, #1	@  curY,  curY
.L6:
	ldr	r3, [fp, #-52]	@  curX
	cmp	r3, r8	@  curY
	ble	.L19
	b	.L24
.L25:
	ldr	r0, [fp, #-52]	@  curX
	ldr	r1, [fp, #-68]
	add	r0, r0, #1
	add	r1, r1, #240
	add	r9, r3, #6	@  p
	sub	sl, sl, #240
	str	r0, [fp, #-52]	@  curX
	str	r1, [fp, #-68]
	b	.L6
.L27:
	.align	2
.L26:
	.word	rand
	.word	-2004318071
	.word	1717986919
	.word	1374389535
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
