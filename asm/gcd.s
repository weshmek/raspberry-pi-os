	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"gcd.c"
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	gcd
	.type	gcd, %function
gcd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L2
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-8]
	bl	gcd
	mov	r3, r0
	b	.L3
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [fp, #-8]
	b	.L3
.L4:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	ldr	r1, [fp, #-12]
	bl	__aeabi_idivmod
	mov	r3, r1
	ldr	r0, [fp, #-12]
	mov	r1, r3
	bl	gcd
	mov	r3, r0
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	gcd, .-gcd
	.ident	"GCC: (GNU) 4.7.2"
