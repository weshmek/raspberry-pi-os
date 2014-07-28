#include <main.h>
.section .init
.globl blink
blink:
ldr r1 ,= 0x20200000
mov r2,#1
lsl r2,#18
str r2, [r1, #4]

mov r2, #1
lsl r2, #16
str r2, [r1, #40]

mov r3, #0x3F0000
wait1$:
sub r3, #1
cmp r3, #0
bne wait1$

str r2, [r1, #28]

mov r3, #0x3F0000
wait2$:
sub r3, #1
cmp r3, #0
bne wait2$

sub r0, #1
cmp r0, #0
bne blink
bx lr

b loop$
