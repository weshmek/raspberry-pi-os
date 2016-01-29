#include <gcd.h>

int gcd(int x, int y)
{
	if (x < y)
	{
		return gcd(y, x);
	}
	if (y == 0)
	{
		return x;
	}
	else
	{
		return gcd(y, x % y);
	}
}

