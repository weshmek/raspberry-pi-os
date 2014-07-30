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
	.file	"doubles.c"
	.global	__aeabi_dadd
	.text
	.align	2
	.global	add_doubles
	.type	add_doubles, %function
add_doubles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd(PLT)
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	add_doubles, .-add_doubles
	.global	__aeabi_ddiv
	.align	2
	.global	divide_doubles
	.type	divide_doubles, %function
divide_doubles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv(PLT)
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	divide_doubles, .-divide_doubles
	.global	__aeabi_dsub
	.align	2
	.global	subtract_doubles
	.type	subtract_doubles, %function
subtract_doubles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub(PLT)
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	subtract_doubles, .-subtract_doubles
	.global	__aeabi_dmul
	.align	2
	.global	multiply_doubles
	.type	multiply_doubles, %function
multiply_doubles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul(PLT)
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	multiply_doubles, .-multiply_doubles
	.ident	"GCC: (GNU) 4.7.2"
