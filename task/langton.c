#include <langton.h>
#include <stdint.h>

enum DIRECTION
{
	NORTH,
	SOUTH,
	EAST,
	WEST

};



void langton(int* grid, int width, int height, int x, int y)
{

	enum DIRECTION dir;
	int pos, i;
	dir = NORTH;
	while ((x > 0) && (x < width) && (y < height) && (0 < y))
	{
		pos = (y * height) + x;

		if (grid[pos] == 0)
		{
			//Turn Left
			switch(dir)
			{
				case NORTH:
					dir = WEST;
					break;
				case SOUTH:
					dir = EAST;
					break;
				case EAST:
					dir = NORTH;
					break;
				case WEST:
					dir = SOUTH;
					break;
				default:
					return;
			}
		}
		else
		{
			//Turn Right
			switch(dir)
			{
				case NORTH:
					dir = EAST;
					break;
				case EAST:
					dir = SOUTH;
					break;
				case SOUTH:
					dir = WEST;
					break;
				case WEST:
					dir = NORTH;
					break;
				default: 
					return;
			}
		}
				

		grid[pos] ^= -1; 
		switch(dir)
		{
			case NORTH:
				y--;
				break;
			case SOUTH:
				y++;
				break;
			case EAST:
				x++;
				break;
			case WEST:
				x--;
				break;
			default:
				return;
		}	
		
		//delay
		for (i = 0; i < 10000; i++)
		{
		}

	}


}
