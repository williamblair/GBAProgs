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
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #4160
	add	r3, r3, #2
	mov	r2, #67108864
	stmfd	sp!, {r4, r5, r6, r7, lr}
	strh	r3, [r2, #0]	@ movhi 
	ldr	r4, .L42
	mov	r5, #10	@  x
	mov	lr, #40	@  y
	mov	r6, #1	@  ydir
	mov	r1, #0	@  n
.L6:
	mov	r2, r1, asl #3	@  n
	mov	r0, #160	@ movhi
	add	r1, r1, #1	@  n,  n
	add	r3, r2, r4
	strh	r0, [r2, r4]	@ movhi 	@  <variable>.attrib0
	cmp	r1, #127	@  n
	mov	r2, #240	@ movhi
	strh	r2, [r3, #2]	@ movhi 	@  <variable>.attrib1
	ble	.L6
	mov	r2, #83886080
	ldr	r0, .L42+4
	mov	r1, #0	@  n
	add	r2, r2, #512
.L11:
	mov	r3, r1, asl #1	@  n
	ldrh	r7, [r3, r0]	@ movhi	@  testPal
	add	r1, r1, #1	@  n,  n
	cmp	r1, #255	@  n
	strh	r7, [r3, r2]	@ movhi 
	ble	.L11
	mov	r0, #2032
	mov	r2, #100663296
	ldr	ip, .L42+8	@  bmpPtr
	mov	r1, #0	@  n
	add	r0, r0, #15
	add	r2, r2, #65536
.L16:
	mov	r3, r1, asl #1	@  n
	ldrh	r7, [r3, ip]	@ movhi	@ * bmpPtr
	add	r1, r1, #1	@  n,  n
	cmp	r1, r0	@  n
	strh	r7, [r3, r2]	@ movhi 
	ble	.L16
	mov	r3, #8192
	mov	r2, #49152
	add	r3, r3, #40
	add	r2, r2, #10
	mov	ip, #0	@ movhi
	strh	r3, [r4, #0]	@ movhi 	@  <variable>.attrib0
	strh	r2, [r4, #2]	@ movhi 	@  <variable>.attrib1
	strh	ip, [r4, #4]	@ movhi 	@  <variable>.attrib2
.L33:
	add	r2, lr, r6	@  y,  ydir
	add	r3, r5, #1	@  x
	mov	r3, r3, asl #16
	mov	r2, r2, asl #16
	mov	lr, r2, asr #16	@  y
	cmp	r3, #11468800
	movle	r5, r3, asr #16	@  x
	movgt	r5, #0	@  x
	cmp	lr, #95	@  y
	movgt	lr, #95	@  y
	mvngt	r6, #0	@  ydir
	cmp	lr, #0	@  y
	movle	lr, #1	@  y
	orr	r3, lr, #8192	@  y
	orr	r2, r5, #49152	@  x
	strh	r3, [r4, #0]	@ movhi 	@  <variable>.attrib0
	strh	r2, [r4, #2]	@ movhi 	@  <variable>.attrib1
	movle	r6, lr	@  ydir,  y
	mov	r1, #67108864
.L23:
	ldrh	r3, [r1, #4]
	ands	r2, r3, #1	@  n
	bne	.L23
	mov	r0, #508
	ldr	ip, .L42	@  temp
	mov	r1, r2	@  n,  n
	add	r0, r0, #3
.L31:
	mov	r2, r1, asl #1	@  n
	add	r3, r2, #117440512
	add	r1, r1, #1	@  n,  n
	ldrh	r2, [r2, ip]	@ movhi	@ * temp
	cmp	r1, r0	@  n
	strh	r2, [r3, #0]	@ movhi 
	ble	.L31
	b	.L33
.L43:
	.align	2
.L42:
	.word	sprites
	.word	testPal
	.word	testTiles
	.size	main, .-main
	.comm	spritePtr, 4, 32
	.comm	sprites, 1024, 32
	.ident	"GCC: (GNU) 3.3.2"
