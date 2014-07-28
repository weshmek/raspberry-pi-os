#include "Heap.h"
#define HEAP_LEFT(i) (2 * i)
#define HEAP_RIGHT(i) (2 * i + 1)
#define HEAP_PARENT(i) (i >> 1)	


void swap(Heap H, unsigned long i, unsigned long j)
{
	double tmp;
	tmp = H.A[i];
	H.A[i] = H.A[j];
	H.A[j] = tmp;
}

void max_heapify(Heap Arr, unsigned long i)
{
	unsigned long j;
	unsigned long largest = i;
	double* A = Arr.A;
	do
	{
		unsigned long l, r;
		j = largest;
		l = HEAP_LEFT(j);
		r = HEAP_RIGHT(j);
		if (l <= Arr.length)
		{
			if (A[l] > A[largest])
			{
				largest = l;
			}
		}
		if (r <= Arr.length)
		{
			if (A[r] > A[largest])
			{
				largest = r;
			}
		}
		swap(Arr, j, largest);
	}while(j != largest);
}

	
Heap build_max_heap(double *Array, unsigned long length)
{
	Heap ret;
	unsigned long i;
	ret.length = length;
	ret.A = Array - 1;
	
	
	for (i = HEAP_PARENT(ret.length); i >= 1; i--)
	{
		max_heapify(ret, i);
	}
	return ret;
}


void Heapsort(double *A, unsigned long length)
{
	unsigned long i, tmp;
	Heap ret = build_max_heap(A, length);
	for (i = ret.length; i >= 2; i--)
	{
		swap(ret, 1, i);
		--ret.length;
		max_heapify(ret, 1);
	}		
}