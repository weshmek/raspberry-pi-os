#include "Heap.h"
#define HEAP_LEFT(i) (2 * i)
#define HEAP_RIGHT(i) (2 * i + 1)
#define HEAP_PARENT(i) (i >> 1)	


typedef struct {heap_elem *A; heap_len length;} Heap;


static inline void swap(Heap H, heap_len i, heap_len j)
{
	heap_elem tmp;
	tmp = H.A[i];
	H.A[i] = H.A[j];
	H.A[j] = tmp;
}

static void max_heapify(Heap Arr, heap_len i)
{
	heap_len j;
	heap_len largest = i;
	heap_elem* A = Arr.A;
	do
	{
		heap_len l, r;
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

	
static Heap build_max_heap(heap_elem *Array, heap_len length)
{
	Heap ret;
	heap_len i;
	ret.length = length;
	ret.A = Array - 1;
	
	
	for (i = HEAP_PARENT(ret.length); i >= 1; i--)
	{
		max_heapify(ret, i);
	}
	return ret;
}


void Heapsort(heap_elem *A, heap_len length)
{
	heap_len i, tmp;
	Heap ret = build_max_heap(A, length);
	for (i = ret.length; i >= 2; i--)
	{
		swap(ret, 1, i);
		--ret.length;
		max_heapify(ret, 1);
	}		
}
