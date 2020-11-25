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
	mov	r3, #1024
	add	r3, r3, #3
	mov	r2, #67108864
	str	lr, [sp, #-4]!
	ldr	r0, .L20
	str	r3, [r2, #0]
	mov	ip, #0	@  x
.L13:
	mov	r2, ip, asl #1	@  x
	mov	r1, #159	@  y
.L12:
	ldrh	lr, [r2, r0]	@ movhi	@  peppers_Bitmap
	add	r3, r2, #100663296
	subs	r1, r1, #1	@  y,  y
	strh	lr, [r3, #0]	@ movhi 
	add	r2, r2, #480
	bpl	.L12
	add	ip, ip, #1	@  x,  x
	cmp	ip, #239	@  x
	ble	.L13
.L14:
	b	.L14
.L21:
	.align	2
.L20:
	.word	peppers_Bitmap
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
