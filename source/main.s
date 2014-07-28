#include <kmain.h>

.section .init
.globl _start
.globl loop$
_start:
mov sp,#0x8000 @Stack starts at code
bl kmain
loop$:
b loop$
