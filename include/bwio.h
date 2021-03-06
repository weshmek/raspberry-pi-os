#ifndef __BWIO_H__
#define __BWIO_H__
#include <global_ascii_font.h>


#define OFF 	0
#define ON	1

struct framebuffer_info;

int activate_gpio(void);

int toggle_led(int stat);

int bw_mailbox_write(int, unsigned int);

unsigned int bw_mailbox_read(int box);

int bw_get_framebuffer(struct framebuffer_info *fbi);

int bwprintf(char *fmt, ...);


int put_char_on_screen_2(struct framebuffer_info *fbi, char, int, int);


#endif
