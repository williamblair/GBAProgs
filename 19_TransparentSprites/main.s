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
	mov	r3, #5184
	sub	fp, ip, #4
	mov	r7, #0	@  counter
	sub	sp, sp, #12
	add	r3, r3, #3
	mov	r2, #67108864
	mov	r1, #-2147483648	@  val
	mov	ip, #38144
	strh	r3, [r2, #0]	@ movhi 
	ldr	lr, .L107
	str	r7, [fp, #-44]	@  counter,  change
	mov	r1, r1, asr #19	@  val,  val
	mov	r5, r7	@  n,  counter
	add	ip, ip, #255
	mov	r0, #100663296
.L16:
	smull	r2, r3, lr, r5	@  n
	mov	r2, r5, asr #31	@  n
	add	r3, r3, r5	@  n
	rsb	r2, r2, r3, asr #7
	rsb	r2, r2, r2, asl #4
	add	r3, r1, #15	@  val
	cmp	r5, r2, asl #4	@  n
	mov	r3, r3, asl #16
	add	r5, r5, #1	@  n,  n
	moveq	r1, r3, asr #16	@  val
	cmp	r5, ip	@  n
	strh	r1, [r0], #2	@ movhi 	@  val
	ble	.L16
	ldr	sl, .L107+4
	mov	r1, #0	@  n
.L21:
	mov	r2, r1, asl #3	@  n
	add	r1, r1, #1	@  n,  n
	add	r3, r2, sl
	mov	ip, #160	@ movhi
	mov	r0, #240	@ movhi
	cmp	r1, #127	@  n
	strh	ip, [r2, sl]	@ movhi 	@  <variable>.attrib0
	strh	r0, [r3, #2]	@ movhi 	@  <variable>.attrib1
	ble	.L21
	mov	r2, #83886080
	ldr	r1, .L107+8
	mov	r5, #0	@  n
	add	r2, r2, #512
.L27:
	mov	r3, r5, asl #1	@  n
	ldrh	ip, [r3, r1]	@ movhi	@  basketballPal
	add	r5, r5, #1	@  n,  n
	cmp	r5, #255	@  n
	strh	ip, [r3, r2]	@ movhi 
	ble	.L27
	mov	r1, #1020
	mov	r2, #100663296
	ldr	r0, .L107+12	@  bmpPtr
	mov	r5, #0	@  n
	add	r1, r1, #3
	add	r2, r2, #81920
.L32:
	mov	r3, r5, asl #1	@  n
	ldrh	ip, [r3, r0]	@ movhi	@ * bmpPtr
	add	r5, r5, #1	@  n,  n
	cmp	r5, r1	@  n
	strh	ip, [r3, r2]	@ movhi 
	ble	.L32
	ldr	r0, .L107+16
	ldr	r9, .L107+20
	str	r0, [fp, #-48]
	mov	r5, #0	@  n
.L45:
	mov	lr, pc
	bx	r9
	ldr	r2, .L107+24
	smull	r3, r1, r2, r0	@  n
	mov	r3, r0, asr #31	@  n
	rsb	r3, r3, r1, asr #6
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	sub	r4, r0, r3, asl #3	@  n
	mov	lr, pc
	bx	r9
	ldr	r3, .L107
	smull	ip, r1, r3, r0	@  n
	mov	r3, r0, asr #31	@  n
	add	r1, r1, r0	@  n
	rsb	r3, r3, r1, asr #6
	rsb	r3, r3, r3, asl #4
	sub	r2, r0, r3, asl #3	@  n
	mov	r1, r4
	mov	r0, r5	@  n
	mov	r3, #32
	mov	ip, #512
	str	ip, [sp, #0]
	bl	InitSprite
	ldr	r0, [fp, #-48]
	ldr	r3, [r0, #-4]	@  <variable>.dirX
	cmp	r3, #0
	mov	r4, r5, asl #5	@  n
	bne	.L96
	ldr	r6, .L107+28
.L40:
	mov	lr, pc
	bx	r9
	smull	r1, r3, r6, r0	@  n
	sub	r3, r3, r0, asr #31	@  n
	add	r3, r3, r3, asl #1
	sub	r0, r0, r3, asl #1	@  n
	sub	r0, r0, #3
	ldr	r2, [fp, #-48]
	cmp	r0, #0
	str	r0, [r2, #-4]	@  <variable>.dirX
	beq	.L40
.L96:
	ldr	ip, [fp, #-48]
	ldr	r3, [ip, #0]	@  <variable>.dirY
	ldr	r8, .L107+32
	cmp	r3, #0
	mov	r6, r4
	mov	r3, r8
	bne	.L98
.L44:
	add	r4, r6, r3
	mov	lr, pc
	bx	r9
	ldr	r2, .L107+28
	smull	r1, r3, r2, r0	@  n
	sub	r3, r3, r0, asr #31	@  n
	add	r3, r3, r3, asl #1
	sub	r0, r0, r3, asl #1	@  n
	sub	r0, r0, #3
	cmp	r0, #0
	str	r0, [r4, #16]	@  <variable>.dirY
	mov	r3, r8
	beq	.L44
.L98:
	ldr	r2, [fp, #-48]
	add	r5, r5, #1	@  n,  n
	add	r2, r2, #32
	cmp	r5, #4	@  n
	str	r2, [fp, #-48]
	ble	.L45
	mov	r3, #2048
	mov	r2, #67108864
	add	r3, r3, #8
	strh	r3, [r2, #82]	@ movhi 
	mov	r3, #1040	@ movhi
	strh	r3, [r2, #80]	@ movhi 
	mov	r6, r2
.L106:
	ldrh	r3, [r6, #6]
	cmp	r3, #159
	bls	.L106
	cmp	r7, #1000	@  counter
	add	r7, r7, #1	@  counter,  counter
	ble	.L53
	ldr	ip, [fp, #-44]	@  change
	cmp	ip, #0
	mov	r7, #0	@  counter
	beq	.L54
	str	r7, [fp, #-44]	@  n,  change
	mov	r5, r7	@  n,  counter
	mov	lr, r7	@  trans,  n
	mov	ip, r8
.L60:
	str	lr, [ip, #28]	@  trans,  <variable>.trans
	ldrh	r3, [ip, #24]	@  <variable>.colorMode
	ldrh	r1, [ip, #28]	@  <variable>.trans
	ldrh	r2, [ip, #8]	@  <variable>.y
	mov	r0, r5, asl #3	@  n
	orr	r3, r3, r1
	add	r5, r5, #1	@  n,  n
	orr	r2, r2, r3
	cmp	r5, #4	@  n
	strh	r2, [r0, sl]	@ movhi 	@  <variable>.attrib0
	add	ip, ip, #32
	ble	.L60
.L53:
	mov	r5, #0	@  n
	mov	r9, #1
	mov	ip, r8
.L77:
	ldr	r3, [ip, #4]	@  <variable>.x
	ldr	r1, [ip, #12]	@  <variable>.dirX
	ldr	r2, [ip, #20]	@  <variable>.size
	add	r3, r3, r1
	rsb	r0, r2, #159
	rsb	r2, r2, #239
	cmp	r3, r2
	str	r3, [ip, #4]	@  <variable>.x
	strgt	r2, [ip, #4]	@  <variable>.x
	rsb	r1, r1, #0
	ldr	r3, [ip, #4]	@  <variable>.x
	strgt	r1, [ip, #12]	@  <variable>.dirX
	cmp	r3, #0
	ldrle	r3, [ip, #12]	@  <variable>.dirX
	rsble	r3, r3, #0
	ldr	r2, [ip, #16]	@  <variable>.dirY
	strle	r3, [ip, #12]	@  <variable>.dirX
	ldr	r3, [ip, #8]	@  <variable>.y
	add	r3, r3, r2
	strle	r9, [ip, #4]	@  <variable>.x
	cmp	r3, r0
	str	r3, [ip, #8]	@  <variable>.y
	strgt	r0, [ip, #8]	@  <variable>.y
	rsb	r2, r2, #0
	ldr	r3, [ip, #8]	@  <variable>.y
	strgt	r2, [ip, #16]	@  <variable>.dirY
	cmp	r3, #0
	ldrle	r3, [ip, #16]	@  <variable>.dirY
	mov	lr, r5, asl #3	@  n
	add	r4, lr, sl
	rsble	r3, r3, #0
	strle	r3, [ip, #16]	@  <variable>.dirY
	ldrh	r2, [r4, #2]	@  <variable>.attrib1
	ldrh	r3, [lr, sl]	@  <variable>.attrib0
	and	r2, r2, #65024
	and	r3, r3, #65280
	strle	r9, [ip, #8]	@  <variable>.y
	strh	r2, [r4, #2]	@ movhi 	@  <variable>.attrib1
	strh	r3, [lr, sl]	@ movhi 	@  <variable>.attrib0
	ldrh	r2, [r4, #2]	@  <variable>.attrib1
	ldrh	r0, [ip, #4]	@  <variable>.x
	ldrh	r3, [lr, sl]	@  <variable>.attrib0
	ldrh	r1, [ip, #8]	@  <variable>.y
	add	r5, r5, #1	@  n,  n
	orr	r2, r2, r0
	orr	r3, r3, r1
	cmp	r5, #4	@  n
	strh	r2, [r4, #2]	@ movhi 	@  <variable>.attrib1
	strh	r3, [lr, sl]	@ movhi 	@  <variable>.attrib0
	add	ip, ip, #32
	ble	.L77
	mov	r0, #508
	ldr	ip, .L107+4	@  temp
	mov	r1, #0	@  n
	add	r0, r0, #3
.L82:
	mov	r2, r1, asl #1	@  n
	add	r3, r2, #117440512
	add	r1, r1, #1	@  n,  n
	ldrh	r2, [r2, ip]	@ movhi	@ * temp
	cmp	r1, r0	@  n
	strh	r2, [r3, #0]	@ movhi 
	ble	.L82
	b	.L106
.L54:
	mov	r0, #1
	str	r0, [fp, #-44]	@  change
	mov	r5, r7	@  n,  counter
	mov	lr, #1024	@  trans
	mov	ip, r8
.L67:
	str	lr, [ip, #28]	@  trans,  <variable>.trans
	ldrh	r3, [ip, #24]	@  <variable>.colorMode
	ldrh	r1, [ip, #28]	@  <variable>.trans
	ldrh	r2, [ip, #8]	@  <variable>.y
	mov	r0, r5, asl #3	@  n
	orr	r3, r3, r1
	add	r5, r5, #1	@  n,  n
	orr	r2, r2, r3
	cmp	r5, #4	@  n
	strh	r2, [r0, sl]	@ movhi 	@  <variable>.attrib0
	add	ip, ip, #32
	ble	.L67
	b	.L53
.L108:
	.align	2
.L107:
	.word	-2004318071
	.word	sprites
	.word	basketballPal
	.word	basketballTiles
	.word	mySprites+16
	.word	rand
	.word	1374389535
	.word	715827883
	.word	mySprites
	.size	main, .-main
	.comm	spritePtr, 4, 32
	.comm	sprites, 1024, 32
	.comm	mySprites, 4096, 32
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ERROR - unhandled sprite size %d\n\000"
	.text
	.align	2
	.type	InitSprite, %function
InitSprite:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	ldr	lr, .L127
	sub	fp, ip, #4
	ldr	r7, .L127+4
	add	ip, lr, r0, asl #5	@  num
	mov	r5, r3	@  size
	cmp	r3, #16	@  size
	mov	r3, #1024
	mov	r6, r0, asl #3	@  num
	str	r3, [ip, #28]	@  <variable>.trans
	ldrh	r3, [fp, #4]	@ movhi	@  tileIndex
	mov	r8, r1	@  x
	add	r1, r6, r7
	strh	r3, [r1, #4]	@ movhi 	@  <variable>.attrib2
	orr	r4, r2, #9216	@  y
	mov	r3, #1
	mov	r1, #8192
	str	r3, [lr, r0, asl #5]	@  <variable>.alive
	str	r1, [ip, #24]	@  <variable>.colorMode
	strh	r4, [r6, r7]	@ movhi 	@  <variable>.attrib0
	str	r5, [ip, #20]	@  size,  <variable>.size
	str	r8, [ip, #4]	@  x,  <variable>.x
	str	r2, [ip, #8]	@  y,  <variable>.y
	mov	r3, #0	@  spriteSize
	beq	.L4
	bgt	.L9
	cmp	r5, #8	@  size
	beq	.L2
.L7:
	mov	r1, r5	@  size
	ldr	r3, .L127+8
	ldr	r0, .L127+12
	mov	lr, pc
	bx	r3
.L1:
	ldmea	fp, {r4, r5, r6, r7, r8, fp, sp, lr}
	bx	lr
.L2:
	add	r2, r6, r7
	orr	r3, r3, r8	@  spriteSize,  x
	strh	r3, [r2, #2]	@ movhi 	@  <variable>.attrib1
	b	.L1
.L9:
	cmp	r5, #32	@  size
	beq	.L5
	cmp	r5, #64	@  size
	bne	.L7
	mov	r3, #49152	@  spriteSize
	b	.L2
.L5:
	mov	r3, #32768	@  spriteSize
	b	.L2
.L4:
	mov	r3, #16384	@  spriteSize
	b	.L2
.L128:
	.align	2
.L127:
	.word	mySprites
	.word	sprites
	.word	printf
	.word	.LC0
	.size	InitSprite, .-InitSprite
	.ident	"GCC: (GNU) 3.3.2"
