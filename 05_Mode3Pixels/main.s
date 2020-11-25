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
	add	r2, r2, #3
	mov	r8, #-2080374781
	mov	r3, #67108864
	add	r8, r8, #2162688
	str	r2, [r3, #0]
	ldr	r7, .L8
	sub	fp, ip, #4
	add	r8, r8, #2112
.L7:
	mov	lr, pc
	bx	r7
	ldr	r2, .L8+4
	smull	r1, r3, r2, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r6, r2, r3, asr #7	@  x
	rsb	r1, r6, r6, asl #4	@  x,  x
	sub	r6, r0, r1, asl #4	@  x
	mov	lr, pc
	bx	r7
	ldr	r3, .L8+8
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r5, r2, r1, asr #6	@  y
	add	r3, r5, r5, asl #2	@  y,  y
	sub	r5, r0, r3, asl #5	@  y
	mov	lr, pc
	bx	r7
	smull	r3, r2, r8, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r4, r3, r0
	mov	lr, pc
	bx	r7
	smull	r1, r2, r8, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0
	orr	r4, r4, r0, asl #5
	mov	lr, pc
	bx	r7
	smull	r2, r1, r8, r0
	mov	r2, r0, asr #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #4
	rsb	r3, r5, r5, asl #4	@  y,  y
	add	r3, r6, r3, asl #4	@  x
	rsb	r2, r2, r2, asl #5
	rsb	r0, r2, r0
	mov	r3, r3, asl #1
	orr	r4, r4, r0, asl #10
	add	r3, r3, #100663296
	strh	r4, [r3, #0]	@ movhi 
	b	.L7
.L9:
	.align	2
.L8:
	.word	rand
	.word	-2004318071
	.word	1717986919
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
