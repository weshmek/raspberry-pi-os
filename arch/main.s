#include <kmain.h>

.section .init
.globl _start
_start:
@ldr sp, .L0
mov sp,#0x8000 @Stack starts here. Where the hell is the best place to put it? 
bl kmain


.globl loop$
.section .text
loop$:
b loop$
.L0:
	.word 0xEFFFFFFF
