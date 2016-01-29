#ifndef __FRAMEBUFFER_INFO_H__
#define __FRAMEBUFFER_INFO_H__


struct framebuffer_info
{
	int physical_width;
	int physical_height;
	int virtual_width;
	int virtual_height;
	int gpu_pitch;
	int bit_depth;
	int x;
	int y;
	int gpu_pointer;
	int gpu_size;
}; 

extern int* frame_buffer_info;

#endif
