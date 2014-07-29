#include <raspberrypi.h>
#include <bwio.h>
#include <framebuffer_info.h>

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
			

int bw_mailbox_write(unsigned int box, unsigned int message)
{
	volatile unsigned int* status_reg = (unsigned int*) MAILBOX_STATUS_ADDR;
	unsigned int* write_reg = (unsigned int*) MAILBOX_WRITE_ADDR;
	while(((*status_reg) & 0x80000000) != 0);
	*write_reg = (box & 0xF) | (message & 0xFFFFFFF0);
	return 0;
}


unsigned int bw_mailbox_read(int box)
{
	volatile unsigned int* status_reg = (unsigned int*) MAILBOX_STATUS_ADDR;
	unsigned int* read_reg = (unsigned int*) MAILBOX_READ_ADDR;
	unsigned int msg;
	do
	{
		while(((*status_reg) & (1 << 30)) != 0);
		msg = *read_reg;
	}while((msg & 0xf) != box);

	return msg & 0xFFFFFFF0;
}
	
	
	

	
unsigned int* bw_get_framebuffer(struct framebuffer_info* fbi)
{
	unsigned int msg = ((unsigned int) frame_buffer_info) + 0x40000000;
	unsigned int rep;
	frame_buffer_info[0] = fbi->physical_width;
	frame_buffer_info[1] = fbi->physical_height;
	frame_buffer_info[2] = fbi->virtual_width;
	frame_buffer_info[3] = fbi->virtual_height;	
	frame_buffer_info[4] = fbi->gpu_pitch;
	frame_buffer_info[5] = fbi->bit_depth;
	frame_buffer_info[6] = fbi->x;
	frame_buffer_info[7] = fbi->y;
	frame_buffer_info[8] = fbi->gpu_pointer;
	frame_buffer_info[9] = fbi->gpu_size;

	bw_mailbox_write(1, msg);
	
	rep = bw_mailbox_read(1); 
	if (rep != 0)
	{
		return 0;
	}
	
	fbi->gpu_pitch = frame_buffer_info[4];
	fbi->gpu_pointer = frame_buffer_info[8];
	fbi->gpu_size = frame_buffer_info[9];

	return (unsigned int*) fbi->gpu_pointer;
}


