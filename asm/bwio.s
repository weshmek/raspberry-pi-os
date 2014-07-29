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
	.align	2
	.global	bw_mailbox_write
	.type	bw_mailbox_write, %function
bw_mailbox_write:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, .L17
	str	r3, [fp, #-8]
	ldr	r3, .L17+4
	str	r3, [fp, #-12]
	mov	r0, r0	@ nop
.L15:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	blt	.L15
	ldr	r3, [fp, #-16]
	and	r2, r3, #15
	ldr	r3, [fp, #-20]
	bic	r3, r3, #15
	orr	r2, r2, r3
	ldr	r3, [fp, #-12]
	str	r2, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L18:
	.align	2
.L17:
	.word	536918168
	.word	536918188
	.size	bw_mailbox_write, .-bw_mailbox_write
	.align	2
	.global	bw_mailbox_read
	.type	bw_mailbox_read, %function
bw_mailbox_read:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	ldr	r3, .L24
	str	r3, [fp, #-8]
	ldr	r3, .L24+4
	str	r3, [fp, #-12]
.L23:
	mov	r0, r0	@ nop
.L20:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	and	r3, r3, #1073741824
	cmp	r3, #0
	bne	.L20
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	and	r2, r3, #15
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L23
	ldr	r3, [fp, #-16]
	bic	r3, r3, #15
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L25:
	.align	2
.L24:
	.word	536918168
	.word	536918144
	.size	bw_mailbox_read, .-bw_mailbox_read
	.align	2
	.global	bw_get_framebuffer
	.type	bw_get_framebuffer, %function
bw_get_framebuffer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #1073741824
	str	r3, [fp, #-8]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #8
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #12
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #16
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #20
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #20]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #24
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #24]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #28
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #28]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #32
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #32]
	str	r2, [r3, #0]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	add	r3, r3, #36
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #36]
	str	r2, [r3, #0]
	mov	r0, #1
	ldr	r1, [fp, #-8]
	bl	bw_mailbox_write
	mov	r0, #1
	bl	bw_mailbox_read
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L27
	mov	r3, #0
	b	.L28
.L27:
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #16]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #32]
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #36]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #36]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #32]
.L28:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	frame_buffer_info
	.size	bw_get_framebuffer, .-bw_get_framebuffer
	.ident	"GCC: (GNU) 4.7.2"
