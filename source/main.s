#include <kmain.h>

.section .init
.globl _start
.globl loop$
_start:
@ldr sp, .L0
mov sp,#0x80000 @Stack starts here. Where the hell is the best place to put it? 
bl kmain
loop$:
b loop$
.L0:
	.word 0xEFFFFFFF
