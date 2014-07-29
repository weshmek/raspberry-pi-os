#include <kmain.h>
#include <blink.h>
#include <fib.h>
#include <bwio.h>
#include <kernel.h>
int kmain()
{
	activate_gpio();
	int k;	
	for(;;)
	{
		toggle_led(ON);
		for(k = 0; k < 100000; k++);
		toggle_led(OFF);
		for (k = 0; k < 100000; k++);
	}
	
	
	return 0;

}
