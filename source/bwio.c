#include <raspberrypi.h>
#include <bwio.h>

int activate_gpio(void)
{
	unsigned int* gpio_addr = (unsigned int*) (GPIO_CONTROLLER_ADDR + 4);
	*gpio_addr |= 1 << 18;
	return 0;
}

	
int toggle_led(int stat)
{
	unsigned int* led_on_addr = (unsigned int*) (GPIO_CONTROLLER_ADDR + 40);
	unsigned int* led_off_addr = (unsigned int*) (GPIO_CONTROLLER_ADDR + 28);
	
	int ret;
	switch(stat)
	{
		case OFF:
		{
			*led_off_addr |= (1 << 16);
			ret = 0;
			break;
		}
		case ON:
		{
			*led_on_addr |= (1 << 16);
			ret = 0;
			break;
		}
		default:
		{
			ret = -1;
			break;
		}
	}
	return ret;
}
			
