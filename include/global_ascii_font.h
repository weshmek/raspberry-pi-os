#ifndef __GLOBAL_ASCII_FONT_H__
#define	__GLOBAL_ASCII_FONT_H__



#define CHARACTER_WIDTH		7	
#define	CHARACTER_HEIGHT	CHARACTER_WIDTH	
#define NUM_PIXELS_PER_CHAR	(CHARACTER_WIDTH * CHARACTER_HEIGHT)	
#define NUM_ASCII_CHARS		128

typedef	char ascii_character[NUM_PIXELS_PER_CHAR] ;
#define DECLARATION	ascii_character global_ascii_table[NUM_ASCII_CHARS]

extern DECLARATION;


#endif
