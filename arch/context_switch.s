.section	.text
.global		activate
.type		activate, %function
.align		2
activate:

	bx	lr

.global		kenter
.type		kenter, %function
.align		2
kenter:
	bx	lr


.global		hard_kenter
.type		hard_kenter, %function
.align		2
hard_kenter:
	bx	lr
