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
	ldr	r1, .L22	@  palette
	mov	r2, #1024
	mov	ip, sp
	cmp	r1, #0	@  palette
	add	r2, r2, #4
	mov	r3, #67108864
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	sub	fp, ip, #4
	str	r2, [r3, #0]
	mov	r7, #83886080	@  paletteMem
	movne	r5, #0	@  i
	beq	.L21
.L13:
	mov	r3, r5, asl #1	@  i
	ldrh	r2, [r3, r1]	@ movhi	@ * palette
	add	r5, r5, #1	@  i,  i
	cmp	r5, #255	@  i
	strh	r2, [r3, r7]	@ movhi 	@ * paletteMem
	ble	.L13
.L14:
	mov	r0, #100663296
	ldr	r1, .L22+4
	mov	r2, #38400
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
.L15:
	b	.L15
.L21:
	mov	r6, #-2080374781
	add	r6, r6, #2162688
	strh	r1, [r7, #0]	@ movhi 	@  palette, * paletteMem
	ldr	r8, .L22+12
	mov	r5, #1	@  i
	add	r6, r6, #2112
.L7:
	mov	lr, pc
	bx	r8
	smull	r3, r2, r6, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r4, r3, r0
	mov	lr, pc
	bx	r8
	smull	r3, r2, r6, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	rsb	r0, r3, r0
	orr	r4, r4, r0, asl #5
	mov	lr, pc
	bx	r8
	smull	r3, r2, r6, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #5
	mov	r2, r5, asl #1	@  i
	rsb	r0, r3, r0
	add	r5, r5, #1	@  i,  i
	orr	r4, r4, r0, asl #10
	cmp	r5, #255	@  i
	strh	r4, [r2, r7]	@ movhi 	@ * paletteMem
	ble	.L7
	b	.L14
.L23:
	.align	2
.L22:
	.word	peppers_Palette
	.word	peppers_Bitmap
	.word	memcpy
	.word	rand
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
