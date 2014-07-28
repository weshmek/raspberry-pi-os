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
	.file	"Heap.c"
	.text
	.align	2
	.global	swap
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #24
	sub	ip, fp, #20
	stmia	ip, {r0, r1}
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #3
	add	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #3
	add	r3, r1, r3
	ldmia	r3, {r3-r4}
	stmia	r2, {r3-r4}
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #3
	add	r2, r2, r3
	sub	r4, fp, #12
	ldmia	r4, {r3-r4}
	stmia	r2, {r3-r4}
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
	.size	swap, .-swap
	.global	__aeabi_dcmpgt
	.align	2
	.global	max_heapify
	.type	max_heapify, %function
max_heapify:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	sub	r3, fp, #44
	stmia	r3, {r0, r1}
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-20]
.L7:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bcc	.L3
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldmia	r3, {r1-r2}
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-20]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
.L8:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
.L3:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcc	.L5
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldmia	r3, {r1-r2}
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-20]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L5
.L9:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
.L5:
	sub	r3, fp, #44
	ldmia	r3, {r0, r1}
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	bl	swap
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L7
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	max_heapify, .-max_heapify
	.align	2
	.global	build_max_heap
	.type	build_max_heap, %function
build_max_heap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #8
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-8]
	b	.L11
.L12:
	sub	r3, fp, #16
	ldmia	r3, {r0, r1}
	ldr	r2, [fp, #-8]
	bl	max_heapify
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L11:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L12
	ldr	r3, [fp, #-24]
	sub	r2, fp, #16
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r0, [fp, #-24]
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	build_max_heap, .-build_max_heap
	.align	2
	.global	Heapsort
	.type	Heapsort, %function
Heapsort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	sub	r3, fp, #16
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	bl	build_max_heap
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L15
.L16:
	sub	r3, fp, #16
	ldmia	r3, {r0, r1}
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	swap
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	sub	r3, fp, #16
	ldmia	r3, {r0, r1}
	mov	r2, #1
	bl	max_heapify
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L15:
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bhi	.L16
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	Heapsort, .-Heapsort
	.ident	"GCC: (GNU) 4.7.2"
