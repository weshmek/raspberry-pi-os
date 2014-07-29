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
	.file	"kernel.c"
	.text
	.align	2
	.global	kernel
	.type	kernel, %function
kernel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 414080
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #413696
	sub	sp, sp, #384
	sub	r3, fp, #413696
	sub	r3, r3, #4
	sub	r3, r3, #380
	mov	r0, r3
	bl	initialize
.L2:
	sub	r3, fp, #413696
	sub	r3, r3, #4
	sub	r3, r3, #380
	add	r3, r3, #4
	mov	r0, r3
	bl	get_next_request
	mov	r2, r0
	ldr	r3, .L3
	sub	r1, fp, #4
	str	r2, [r1, r3]
	sub	r3, fp, #413696
	sub	r3, r3, #4
	sub	r3, r3, #380
	mov	r0, r3
	bl	handle
	b	.L2
.L4:
	.align	2
.L3:
	.word	-414076
	.size	kernel, .-kernel
	.align	2
	.type	get_next_request, %function
get_next_request:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	get_next_request, .-get_next_request
	.align	2
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r1, .L9
	add	r1, r3, r1
	ldr	r3, [fp, #-8]
	add	r2, r3, #413696
	add	r2, r2, #320
	ldr	r3, [fp, #-8]
	add	r3, r3, #413696
	add	r3, r3, #316
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	initialize_priority_queues
	ldr	r3, [fp, #-8]
	add	r2, r3, #8
	ldr	r1, [fp, #-8]
	ldr	r3, .L9+4
	add	r3, r1, r3
	mov	r0, r2
	mov	r1, r3
	bl	initialize_task_structs
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	412412
	.word	412408
	.size	initialize, .-initialize
	.align	2
	.type	handle, %function
handle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	handle, .-handle
	.ident	"GCC: (GNU) 4.7.2"
