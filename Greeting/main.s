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

	.global	__gba_multiboot
	.data
	.align	2
	.type	__gba_multiboot, %object
	.size	__gba_multiboot, 4
__gba_multiboot:
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Greetings\000"
	.align	2
.LC1:
	.ascii	"Welcome to the World of\000"
	.align	2
.LC2:
	.ascii	"Gameboy Advance Programming\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	ldr	r3, .L6
	sub	fp, ip, #4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L6+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L6+8
.L5:
	mov	r0, #0
	mov	r1, r0
	ldr	r2, .L6+12
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r1, #2
	ldr	r2, .L6+16
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r1, #4
	ldr	r2, .L6+20
	mov	lr, pc
	bx	r4
	b	.L5
.L7:
	.align	2
.L6:
	.word	ham_Init
	.word	ham_InitText
	.word	ham_DrawText
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
