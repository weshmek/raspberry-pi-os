#include <conway.h>

static void copy_board(const char *src, char* dest, const int size)
{
	int i;
	for (i = 0; i < size; i++)
	{
		dest[i] = src[i];
	}

}

static void clear_board(char * board, const int size)
{
	int i;
	for (i = 0; i < size; i++)
	{
		board[i] = 0;
	}
}


void conway(char *board, char *buffer, const int width, const int height, const int generations)
{
	int i, j, g;
	int surrounding_sum;
	const int size = width * height;	
	
	for (g = 0; g < generations; g++)
	{
		for (i = 0; i < height; i++)
		{
			for (j = 0; j < width; j++)
			{
				if (i > 0)
				{
					if (j > 0)
						surrounding_sum += board[(height * (i - 1)) + j - 1];
					surrounding_sum += board[(height * (i - 1)) + j];
					if (j < width - 1)
						surrounding_sum += board[(height * (i - 1)) + j + 1];
				}
				if (j > 0)
					surrounding_sum += board[(height * i) + j - 1];
				if (j < width - 1) 		
					surrounding_sum += board[(height * i) + j + 1];
				if (i < height - 1)
				{
					if (j > 0)
						surrounding_sum += board[(height * (i + 1)) + j - 1];
					surrounding_sum += board[(height * (i + 1) + j];
					if (j < width - 1)
						surrounding_sum += board[(height * (i + 1) + j + 1];
				}
				
			}
			
		}
	
	}

}
