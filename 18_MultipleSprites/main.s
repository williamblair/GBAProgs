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

	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ERROR - unhandled sprite size %d\n\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	r3, #5184
	mov	ip, sp
	add	r3, r3, #3
	mov	r2, #67108864
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mov	r1, #-2147483648	@  val
	sub	fp, ip, #4
	strh	r3, [r2, #0]	@ movhi 
	mov	ip, #38144
	ldr	lr, .L89
	mov	r1, r1, asr #19	@  val,  val
	mov	r9, #32	@  ballWidth
	mov	r4, #0	@  n
	add	ip, ip, #255
	mov	r0, #100663296
.L7:
	smull	r2, r3, lr, r4	@  n
	mov	r2, r4, asr #31	@  n
	add	r3, r3, r4	@  n
	rsb	r2, r2, r3, asr #7
	rsb	r2, r2, r2, asl #4
	add	r3, r1, #15	@  val
	cmp	r4, r2, asl #4	@  n
	mov	r3, r3, asl #16
	add	r4, r4, #1	@  n,  n
	moveq	r1, r3, asr #16	@  val
	cmp	r4, ip	@  n
	strh	r1, [r0], #2	@ movhi 	@  val
	ble	.L7
	ldr	r8, .L89+4
	mov	r1, #0	@  n
.L12:
	mov	r2, r1, asl #3	@  n
	add	r1, r1, #1	@  n,  n
	add	r3, r2, r8
	mov	ip, #160	@ movhi
	mov	lr, #240	@ movhi
	cmp	r1, #127	@  n
	strh	ip, [r2, r8]	@ movhi 	@  <variable>.attrib0
	strh	lr, [r3, #2]	@ movhi 	@  <variable>.attrib1
	ble	.L12
	mov	r2, #83886080
	ldr	r1, .L89+8
	mov	r4, #0	@  n
	add	r2, r2, #512
.L18:
	mov	r3, r4, asl #1	@  n
	ldrh	r0, [r3, r1]	@ movhi	@  basketballPal
	add	r4, r4, #1	@  n,  n
	cmp	r4, #255	@  n
	strh	r0, [r3, r2]	@ movhi 
	ble	.L18
	mov	r1, #1020
	mov	r2, #100663296
	ldr	r0, .L89+12	@  bmpPtr
	mov	r4, #0	@  n
	add	r1, r1, #3
	add	r2, r2, #81920
.L23:
	mov	r3, r4, asl #1	@  n
	ldrh	ip, [r3, r0]	@ movhi	@ * bmpPtr
	add	r4, r4, #1	@  n,  n
	cmp	r4, r1	@  n
	strh	ip, [r3, r2]	@ movhi 
	ble	.L23
	mov	r4, #0	@  n
	ldr	r7, .L89+16
	ldr	r6, .L89+20
	mov	sl, r4	@  n,  n
.L45:
	mov	lr, pc
	bx	r7
	ldr	r3, .L89+24
	smull	lr, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r5, r2, r1, asr #6	@  x
	add	r3, r5, r5, asl #2	@  x,  x
	add	r3, r3, r3, asl #2
	sub	r5, r0, r3, asl #3	@  x
	mov	lr, pc
	bx	r7
	ldr	r2, .L89
	smull	r1, r3, r2, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	ip, r2, r3, asr #6	@  y
	rsb	r1, ip, ip, asl #4	@  y,  y
	sub	ip, r0, r1, asl #3	@  y
	mov	r3, #32
	ldr	lr, .L89+20
	cmp	r3, #16
	mov	r2, r4, asl #3	@  n
	mov	r3, #1
	orr	r1, ip, #8192	@  y
	add	r0, r2, r8
	str	r3, [sl, lr]	@  <variable>.alive
	strh	r1, [r2, r8]	@ movhi 	@  <variable>.attrib0
	orrgt	r3, r5, #32768	@  x
	mov	r1, #512	@ movhi
	str	r9, [r6, #20]	@  ballWidth,  <variable>.size
	stmib	r6, {r5, ip}	@ phole stm
	strh	r1, [r0, #4]	@ movhi 	@  <variable>.attrib2
	strgth	r3, [r0, #2]	@ movhi 	@  <variable>.attrib1
	ble	.L88
.L34:
	ldr	r3, [r6, #12]	@  <variable>.dirX
	cmp	r3, #0
	bne	.L80
	ldr	r5, .L89+28
.L40:
	mov	lr, pc
	bx	r7
	smull	ip, r3, r5, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	sub	r0, r0, r3, asl #1
	sub	r0, r0, #3
	cmp	r0, #0
	str	r0, [r6, #12]	@  <variable>.dirX
	beq	.L40
.L80:
	ldr	r3, [r6, #16]	@  <variable>.dirY
	cmp	r3, #0
	bne	.L82
	ldr	r5, .L89+28
.L44:
	mov	lr, pc
	bx	r7
	smull	lr, r3, r5, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	sub	r0, r0, r3, asl #1
	sub	r0, r0, #3
	cmp	r0, #0
	str	r0, [r6, #16]	@  <variable>.dirY
	beq	.L44
.L82:
	add	r4, r4, #1	@  n,  n
	cmp	r4, #9	@  n
	add	sl, sl, #24	@  n,  n
	add	r6, r6, #24
	ble	.L45
	mov	r6, #67108864
.L87:
	ldrh	r3, [r6, #6]
	cmp	r3, #159
	bls	.L87
	ldr	ip, .L89+20
	mov	r4, #0	@  n
	mov	r7, #1
.L62:
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
	strle	r7, [ip, #4]	@  <variable>.x
	cmp	r3, r0
	str	r3, [ip, #8]	@  <variable>.y
	strgt	r0, [ip, #8]	@  <variable>.y
	rsb	r2, r2, #0
	ldr	r3, [ip, #8]	@  <variable>.y
	strgt	r2, [ip, #16]	@  <variable>.dirY
	cmp	r3, #0
	ldrle	r3, [ip, #16]	@  <variable>.dirY
	mov	lr, r4, asl #3	@  n
	add	r5, lr, r8
	rsble	r3, r3, #0
	strle	r3, [ip, #16]	@  <variable>.dirY
	ldrh	r2, [r5, #2]	@  <variable>.attrib1
	ldrh	r3, [lr, r8]	@  <variable>.attrib0
	and	r2, r2, #65024
	and	r3, r3, #65280
	strle	r7, [ip, #8]	@  <variable>.y
	strh	r2, [r5, #2]	@ movhi 	@  <variable>.attrib1
	strh	r3, [lr, r8]	@ movhi 	@  <variable>.attrib0
	ldrh	r2, [r5, #2]	@  <variable>.attrib1
	ldrh	r0, [ip, #4]	@  <variable>.x
	ldrh	r3, [lr, r8]	@  <variable>.attrib0
	ldrh	r1, [ip, #8]	@  <variable>.y
	add	r4, r4, #1	@  n,  n
	orr	r2, r2, r0
	orr	r3, r3, r1
	cmp	r4, #9	@  n
	strh	r2, [r5, #2]	@ movhi 	@  <variable>.attrib1
	strh	r3, [lr, r8]	@ movhi 	@  <variable>.attrib0
	add	ip, ip, #24
	ble	.L62
	mov	r0, #508
	ldr	ip, .L89+4	@  temp
	mov	r1, #0	@  n
	add	r0, r0, #3
.L67:
	mov	r2, r1, asl #1	@  n
	add	r3, r2, #117440512
	add	r1, r1, #1	@  n,  n
	ldrh	r2, [r2, ip]	@ movhi	@ * temp
	cmp	r1, r0	@  n
	strh	r2, [r3, #0]	@ movhi 
	ble	.L67
	b	.L87
.L88:
	mov	r1, #32
	ldr	r2, .L89+32
	ldr	r0, .L89+36
	mov	lr, pc
	bx	r2
	b	.L34
.L90:
	.align	2
.L89:
	.word	-2004318071
	.word	sprites
	.word	basketballPal
	.word	basketballTiles
	.word	rand
	.word	mySprites
	.word	1374389535
	.word	715827883
	.word	printf
	.word	.LC0
	.size	main, .-main
	.comm	spritePtr, 4, 32
	.comm	sprites, 1024, 32
	.comm	mySprites, 3072, 32
	.ident	"GCC: (GNU) 3.3.2"
