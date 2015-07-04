.section	.text
.global		activate
.type		activate, %function
.align		2
activate:
@ r0 <- task
@
	stm	sp, {r0-r14} 

	mov	fp, sp

		
	mrs	r0, cpsr
	msr	spsr, r1
	bx	lr
.size	activate, .-activate

.global		kenter
.type		kenter, %function
.align		2
kenter:
	bx	lr
.size		kenter, .-kenter


.global		hard_kenter
.type		hard_kenter, %function
.align		2
hard_kenter:
	bx	lr
.size		hard_kenter, .-hard_kenter
