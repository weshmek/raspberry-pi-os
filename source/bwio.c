#include <raspberrypi.h>
#include <bwio.h>
#include <framebuffer_info.h>
#include <varargs.h>
#include <global_ascii_font.h>

static int set_pixel(struct framebuffer_info *fb, unsigned int x, unsigned int y, char colour);

int activate_gpio(void)
{
	volatile unsigned int* const gpio_addr = (unsigned int*) (GPIO_CONTROLLER_ADDR + 4);
	*gpio_addr |= 1 << 18;
	return 0;
}

	
int toggle_led(int stat)
{
	volatile unsigned int* const led_on_addr = (unsigned int*) (GPIO_CONTROLLER_ADDR + 40);
	volatile unsigned int* const led_off_addr = (unsigned int*) (GPIO_CONTROLLER_ADDR + 28);
	
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
			

int bw_mailbox_write(int box, unsigned int message)
{
	volatile unsigned int* const status_reg = (unsigned int*) MAILBOX_STATUS_ADDR;
	volatile unsigned int* const write_reg = (unsigned int*) MAILBOX_WRITE_ADDR;
	while(((*status_reg) & 0x80000000)  != 0);
	*write_reg = (box & 0xF) | (message & 0xFFFFFFF0);
	return 0;
}


unsigned int bw_mailbox_read(int box)
{
	volatile unsigned int* const status_reg = (unsigned int*) MAILBOX_STATUS_ADDR;
	volatile unsigned int* const read_reg = (unsigned int*) MAILBOX_READ_ADDR;
	volatile unsigned int* const poll_reg = (unsigned int*) MAILBOX_POLL_ADDR;
	unsigned int msg;
	do
	{
		while(((*status_reg) & 0x40000000) != 0);
		msg = *poll_reg;
	}while((msg & 0xf) != box);
	msg = *read_reg;

	return msg & 0xFFFFFFF0;
}
	
	
int bw_get_framebuffer(struct framebuffer_info* fbi)
{
	unsigned int msg = ((unsigned int) frame_buffer_info) + 0x40000000;
	unsigned int rep;
	frame_buffer_info[0] = fbi->physical_width;
	frame_buffer_info[1] = fbi->physical_height;
	frame_buffer_info[2] = fbi->virtual_width;
	frame_buffer_info[3] = fbi->virtual_height;	
	frame_buffer_info[5] = fbi->bit_depth;
	frame_buffer_info[6] = fbi->x;
	frame_buffer_info[7] = fbi->y;

	bw_mailbox_write(1, msg);
	
	rep = bw_mailbox_read(1); 
	if (rep != 0)
	{
		return 0;
	}
	
	fbi->gpu_pitch = frame_buffer_info[4];
	fbi->gpu_pointer = frame_buffer_info[8];
	fbi->gpu_size = frame_buffer_info[9];

	return 1;
}


int put_char_on_screen(unsigned int* frame_buffer, unsigned int virtual_width, unsigned int x, unsigned int y, unsigned int ch)
{
	int i, j, k;
	unsigned int *character_bitmap = global_ascii_table[ch];
	k = 0;
	for (i = 0; i < CHARACTER_HEIGHT; i++)
	{
		for (j = 0; j < CHARACTER_WIDTH; j++)
		{
			frame_buffer[(x + j) + (virtual_width * (y + j))] = character_bitmap[k];
			k++;
		}
	}
	return 0;
}

int put_char_on_screen_2(struct framebuffer_info * fbi, char ch, int x, int y)
{
	int i, j, k;
	unsigned int *character_bitmap = global_ascii_table[ch];
	k = 0;
	for (i = 0; i < CHARACTER_HEIGHT; i++)
	{
		for (j = 0; j < CHARACTER_WIDTH; j++)
		{
			((unsigned int *) fbi->gpu_pointer)[(x + j) + (fbi->virtual_width * (y + j))] = character_bitmap[k];
			k++;
		}
	}
	return 0;
}


int bwprintnum(int num)
{
	return 0;
}
			



int bwprintf(char* fmt, ...)
{
	va_list va;
	unsigned int index;
	index = 0;	
	va_start(va, fmt);
	while (fmt[index] != '\0')
	{
		if (fmt[index] == '%')
		{
			index++;
			switch (fmt[index])
			{
				case 'd':
				{
					int num;
					num = va_arg(va, int);
					bwprintnum(num);
					break;
				}
				case 'c':
				{
					char ch;
					ch = va_arg(va, char);
					//put_char_on_screen(ch);
					break;
				}
					

				
				default:
				{
					goto fail;
				}
			}
		}
		else
		{
			//put_char_on_screen(fmt[index]);
		}
		index++;
	}
	va_end(va);
	return 0;
fail:
	va_end(va);
	return -1;

}

int vbwprintf (char* fmt, va_list va)
{
	return 0;
}


static int set_pixel(struct framebuffer_info* fbi, unsigned int x, unsigned int y, char colour)
{
	((unsigned int*)fbi->gpu_pointer)[x + (y*fbi->virtual_height)] = colour;

	return 0;
}
