#include <task.h>
#include <raspberrypi.h>
struct kernel_stack
{
	unsigned int *swi_address;
	unsigned int *swi_instruction;

	struct task active;
};

static int initialize(struct kernel_stack* stack);

static int handle(struct kernel_stack *stack);



int kernel(void)
{
	struct kernel_stack stack;

	stack.swi_address = (unsigned int*) SWI_ADDRESS;
	stack.swi_instruction = (unsigned int*) SWI_INSTRUCTION;	
	
	initialize(&stack);
	
	do
	{
		handle(&stack);
	}while(1);
	
	return 0;
}



static int initialize(struct kernel_stack* stack)
{
	(void) stack;
	return 0;
}


static int handle(struct kernel_stack* stack)
{
	(void) stack;
	return 0;
}

