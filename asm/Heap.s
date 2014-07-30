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
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #24
	sub	ip, fp, #28
	stmia	ip, {r0, r1, r2, r3}
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #4]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #4]
	mov	r3, r3, asl #3
	add	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #12]
	mov	r3, r3, asl #3
	add	r3, r1, r3
	ldmia	r3, {r3-r4}
	stmia	r2, {r3-r4}
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #12]
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
	.type	max_heapify, %function
max_heapify:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #76
	sub	ip, fp, #68
	stmia	ip, {r0, r1, r2, r3}
	ldmib	fp, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-24]
.L7:
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	adds	r3, r3, r3
	adc	r4, r4, r4
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	adds	r3, r3, r3
	adc	r4, r4, r4
	mov	r1, r3
	mov	r2, r4
	mov	r3, #1
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	sub	r2, fp, #60
	ldmia	r2, {r1-r2}
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	cmp	r2, r4
	it eq
	cmpeq	r1, r3
	bcc	.L3
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldmia	r3, {r1-r2}
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-24]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmpgt(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
.L8:
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
.L3:
	sub	r2, fp, #60
	ldmia	r2, {r1-r2}
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	cmp	r2, r4
	it eq
	cmpeq	r1, r3
	bcc	.L5
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldmia	r3, {r1-r2}
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-24]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmpgt(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L5
.L9:
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
.L5:
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	sub	r3, fp, #68
	ldmia	r3, {r0, r1, r2, r3}
	bl	swap(PLT)
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	cmp	r2, r4
	it eq
	cmpeq	r1, r3
	bne	.L7
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	max_heapify, .-max_heapify
	.align	2
	.type	build_max_heap, %function
build_max_heap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #52
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #8
	str	r3, [fp, #-36]
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	b	.L11
.L12:
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r3, fp, #36
	ldmia	r3, {r0, r1, r2, r3}
	bl	max_heapify(PLT)
	sub	r2, fp, #20
	ldmia	r2, {r1-r2}
	mvn	r3, #0
	mvn	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
.L11:
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	orrs	r2, r3, r4
	bne	.L12
	ldr	r3, [fp, #-40]
	mov	ip, r3
	sub	r3, fp, #36
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r0, [fp, #-40]
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	build_max_heap, .-build_max_heap
	.align	2
	.global	Heapsort
	.type	Heapsort, %function
Heapsort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #60
	str	r0, [fp, #-40]
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	sub	r3, fp, #36
	mov	r0, r3
	ldr	r1, [fp, #-40]
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	build_max_heap(PLT)
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	b	.L15
.L16:
	mov	r3, #1
	mov	r4, #0
	stmia	sp, {r3-r4}
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	sub	r3, fp, #36
	ldmia	r3, {r0, r1, r2, r3}
	bl	swap(PLT)
	sub	r2, fp, #28
	ldmia	r2, {r1-r2}
	mvn	r3, #0
	mvn	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	mov	r3, #1
	mov	r4, #0
	stmia	sp, {r3-r4}
	sub	r3, fp, #36
	ldmia	r3, {r0, r1, r2, r3}
	bl	max_heapify(PLT)
	sub	r2, fp, #20
	ldmia	r2, {r1-r2}
	mvn	r3, #0
	mvn	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
.L15:
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	mov	r1, #1
	mov	r2, #0
	cmp	r2, r4
	it eq
	cmpeq	r1, r3
	bcc	.L16
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	Heapsort, .-Heapsort
	.ident	"GCC: (GNU) 4.7.2"
