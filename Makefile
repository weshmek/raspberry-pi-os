XCC = arm-none-eabi-gcc
XPP = arm-none-eabi-g++
AS	= arm-none-eabi-as
ASFLAGS	= --fatal-warnings

CFLAGS = -S -c -I include -fPIC -O0  -Werror
LDFLAGS = -Llib -L/cygdrive/c/yagarto/lib/gcc/arm-none-eabi/4.7.2/  -d
all : kernel.img 

kernel.img : build/fib.o build/main.o build/kmain.o build/blink.o build/Heap.o build/bwio.o  build/gcd.o build/doubles.o build/kernel.o build/scheduler.o build/task.o build/framebuffer_info.o build/context_switch.o build/global_ascii_font.o asm/task-struct-addrs.s build/font.o build/dma_control_block.o
	arm-none-eabi-ld  -nostdlibs -L"C:\Program Files\yagarto\yagarto-20121222\lib\gcc\arm-none-eabi\4.7.2" -o build/output.elf -init _start -N -T kernel.ld -Map=kernel.map --no-undefined build/fib.o build/main.o build/kmain.o build/blink.o build/bwio.o build/gcd.o build/doubles.o build/kernel.o build/scheduler.o build/task.o build/framebuffer_info.o build/context_switch.o build/global_ascii_font.o build/Heap.o build/font.o build/dma_control_block.o -lgcc
	arm-none-eabi-objdump -dtS build/output.elf > kernel.out
		 
	arm-none-eabi-objcopy build/output.elf -O binary kernel.img

build/font.o : arch/font.s
	${AS} ${ASFLAGS} -I include arch/font.s -c -o build/font.o

build/main.o : arch/main.s
	${AS} ${ASFLAGS} -I include arch/main.s -c -o build/main.o


asm/kmain.s : source/kmain.c
	${XCC} ${CFLAGS} -o $@ source/kmain.c

asm/fib.s : source/fib.c
	${XCC} ${CFLAGS} -o $@ source/fib.c

asm/gcd.s : source/gcd.c
	${XCC} ${CFLAGS} -o $@ source/gcd.c

asm/Heap.s : source/Heap.c include/Heap.h
	${XCC} ${CFLAGS} -o $@ source/Heap.c

asm/doubles.s : source/doubles.c
	${XCC} ${CFLAGS} -o $@ source/doubles.c

asm/bwio.s : source/bwio.c
	${XCC} ${CFLAGS} -o $@ source/bwio.c

asm/kernel.s : source/kernel.c
	${XCC} ${CFLAGS} -o $@ source/kernel.c

asm/cpptest.s : source/cpptest.cpp
	${XPP} ${CFLAGS} -o $@ source/cpptest.cpp

asm/scheduler.s : source/scheduler.c
	${XCC} ${CFLAGS} -o $@ source/scheduler.c

asm/task.s : source/task.c
	${XCC} ${CFLAGS} -o $@ source/task.c

asm/global_ascii_font.s : source/global_ascii_font.c include/global_ascii_font.h
	${XCC} ${CFLAGS} -o $@ source/global_ascii_font.c

asm/task-struct-addrs.s : source/task-struct-addrs.c source/task.c
	${XCC} ${CFLAGS} -o $@ source/task-struct-addrs.c

build/dma_control_block.o : arch/dma_control_block.s
	${AS} ${ASFLAGS} -o $@ arch/dma_control_block.s
	
build/kmain.o : asm/kmain.s
	${AS} asm/kmain.s -o $@

build/blink.o : arch/blink.s
	${AS}  ${ASFLAGS} -I include arch/blink.s -c -o build/blink.o

build/fib.o : asm/fib.s
	${AS} ${ASFLAGS} -o $@ asm/fib.s

build/gcd.o : asm/gcd.s
	${AS} ${ASFLAGS} asm/gcd.s -o build/gcd.o


build/Heap.o : asm/Heap.s
	${AS} ${ASFLAGS} -o $@ asm/Heap.s

build/bwio.o : asm/bwio.s
	${AS} ${ASFLAGS} -o $@ asm/bwio.s

build/doubles.o : asm/doubles.s
	${AS} ${ASFLAGS} -o $@ asm/doubles.s

build/kernel.o : asm/kernel.s
	${AS} ${ASFLAGS} -o $@ asm/kernel.s

build/cpptest.o : asm/cpptest.s
	${AS} ${ASFLAGS} -o $@ asm/cpptest.s

build/scheduler.o : asm/scheduler.s
	${AS} ${ASFLAGS} -o $@ asm/scheduler.s

build/task.o : asm/task.s
	${AS} ${ASFLAGS} -o $@ asm/task.s

build/framebuffer_info.o : arch/framebuffer_info.s
	${AS} ${ASFLAGS} -o $@ arch/framebuffer_info.s

build/context_switch.o : arch/context_switch.s
	${AS} ${ASFLAGS} -o $@ arch/context_switch.s


build/global_ascii_font.o : asm/global_ascii_font.s
	${AS} ${ASFLAGS} -o $@ asm/global_ascii_font.s


clean : 
	rm asm/*.s
	rm build/*

depend: 
	${XCC} -I include -M source/*.s > deps

rebuild : clean all

reinstall : clean install

install : all /cygdrive/g/recovery.img
	cp kernel.img /cygdrive/g/recovery.img

-include deps
