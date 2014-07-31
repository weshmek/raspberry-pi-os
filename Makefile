XCC = arm-none-eabi-gcc
XPP = arm-none-eabi-g++
AS	= arm-none-eabi-as

CFLAGS = -S -c -I include -fPIC -O0  -Werror
LDFLAGS = -Llib -L/cygdrive/c/yagarto/lib/gcc/arm-none-eabi/4.7.2/  -d
all : kernel.img 

kernel.img : build/fib.o build/main.o build/kmain.o build/blink.o build/Heap.o build/bwio.o  build/gcd.o build/doubles.o build/kernel.o build/scheduler.o build/task.o build/framebuffer_info.o build/context_switch.o build/global_ascii_font.o
	arm-none-eabi-ld  -nostdlibs -L"C:\yagarto\lib\gcc\arm-none-eabi\4.7.2" -o build/output.elf -init _start -N -T kernel.ld -Map=kernel.map --no-undefined build/fib.o build/main.o build/kmain.o build/blink.o build/bwio.o build/gcd.o build/doubles.o build/kernel.o build/scheduler.o build/task.o build/framebuffer_info.o build/context_switch.o build/global_ascii_font.o  -lgcc
	arm-none-eabi-objdump -dtS build/output.elf > kernel.out
		 
	arm-none-eabi-objcopy build/output.elf -O binary kernel.img

build/main.o : arch/main.s
	${AS} -I include arch/main.s -c -o build/main.o


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
	
build/kmain.o : asm/kmain.s
	${AS} asm/kmain.s -o $@

build/blink.o : arch/blink.s
	${AS} -I include arch/blink.s -c -o build/blink.o

build/fib.o : asm/fib.s
	${AS} -o $@ asm/fib.s

build/gcd.o : asm/gcd.s
	${AS} asm/gcd.s -o build/gcd.o


build/Heap.o : asm/Heap.s
	${AS} -o $@ asm/Heap.s

build/bwio.o : asm/bwio.s
	${AS} -o $@ asm/bwio.s

build/doubles.o : asm/doubles.s
	${AS} -o $@ asm/doubles.s

build/kernel.o : asm/kernel.s
	${AS} -o $@ asm/kernel.s

build/cpptest.o : asm/cpptest.s
	${AS} -o $@ asm/cpptest.s

build/scheduler.o : asm/scheduler.s
	${AS} -o $@ asm/scheduler.s

build/task.o : asm/task.s
	${AS} -o $@ asm/task.s

build/framebuffer_info.o : arch/framebuffer_info.s
	${AS} -o $@ arch/framebuffer_info.s

build/context_switch.o : arch/context_switch.s
	${AS} -o $@ arch/context_switch.s


build/global_ascii_font.o : asm/global_ascii_font.s
	${AS} -o $@ asm/global_ascii_font.s


clean : 
	rm asm/*.s
	rm build/*

depend: 
	${XCC} -I include -M source/*.s > deps

rebuild : clean all

reinstall : clean install

install : all
	cp kernel.img /cygdrive/j/recovery.img

-include deps
