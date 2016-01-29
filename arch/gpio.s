.globl SetGpioFunction
SetGpioFunction:
cmp r0, #53
cmpls r1, #7
movhi pc, lr


.globl GetGpioAddress
GetGpioAddress:
ldr r0,=0x20200000
mov pc,lr
