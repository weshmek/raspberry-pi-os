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
	.file	"bwio.c"
	.text
	.align	2
	.global	activate_gpio
	.type	activate_gpio, %function
activate_gpio:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	ldr	r3, .L3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	orr	r2, r3, #262144
	ldr	r3, [fp, #-8]
	str	r2, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L4:
	.align	2
.L3:
	.word	538968068
	.size	activate_gpio, .-activate_gpio
	.align	2
	.global	toggle_led
	.type	toggle_led, %function
toggle_led:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	ldr	r3, .L12
	str	r3, [fp, #-12]
	ldr	r3, .L12+4
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L7
	cmp	r3, #1
	beq	.L8
	b	.L11
.L7:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	orr	r2, r3, #65536
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L9
.L8:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	orr	r2, r3, #65536
	ldr	r3, [fp, #-12]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L9
.L11:
	mvn	r3, #0
	str	r3, [fp, #-8]
	mov	r0, r0	@ nop
.L9:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L13:
	.align	2
.L12:
	.word	538968104
	.word	538968092
	.size	toggle_led, .-toggle_led
	.ident	"GCC: (GNU) 4.7.2"
