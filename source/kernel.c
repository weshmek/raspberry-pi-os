#include <task.h>
#include <scheduler.h>
#include <raspberrypi.h>
#include <framebuffer_info.h>
#include <defaults.h>
#include <bwio.h>


int activate(struct task*);
void kenter(void);
void hard_kenter(void);

/*
 * In CS452 we passed basically the entire kernel stack to initialize and handle in the
 * parameter list. I'll bet this made the program a little slower, and meant I had to
 * change the parameter lists, and the declarations for all the functions.
 */
struct kernel_stack
{
	int request;

	struct task *active;

	struct task tasks[NUM_TASKS];
	struct task *task_free_list;

	struct priority_queue priority_queues[NUM_TASKS];
	struct priority_queue *priority_queue_free_list;
	struct priority_queue *schedule[NUM_PRIORITIES];

	struct framebuffer_info fb;

	int i;
	

};

static int initialize(struct kernel_stack* stack);

static int handle(struct kernel_stack *stack);

static int get_next_request(struct task **active);


int kernel(void)
{
	struct kernel_stack stack;

	
	initialize(&stack);

	toggle_led(ON);

	
	
	do
	{
		
		
		for (stack.i = 0; stack.i < stack.fb.gpu_size; stack.i++)
		{
			((unsigned int *)stack.fb.gpu_pointer)[stack.i] = 0x001ff800;
		}
			
		
	}while(1);
	
	return 0;
}

static int get_next_request(struct task** active)
{
	(void) active;
	return 0;
}




static int initialize(struct kernel_stack* stack)
{
	int x;
	unsigned int* swi_interrupt_address = (unsigned int*) SWI_ADDRESS;
	unsigned int* swi_instruction = 	(unsigned int*) SWI_INSTRUCTION;

	*swi_interrupt_address = (unsigned int) kenter;

	

	initialize_priority_queues(stack->priority_queues, stack->schedule, &stack->priority_queue_free_list);
	initialize_task_structs(stack->tasks, &stack->task_free_list);

	stack->fb.physical_width = DEFAULT_SCREEN_PHYSICAL_WIDTH;
	stack->fb.physical_height = DEFAULT_SCREEN_PHYSICAL_HEIGHT;
	stack->fb.virtual_width	= DEFAULT_SCREEN_VIRTUAL_WIDTH;
	stack->fb.virtual_height	= DEFAULT_SCREEN_VIRTUAL_HEIGHT;
	stack->fb.bit_depth	= DEFAULT_SCREEN_BIT_DEPTH;
	stack->fb.x		= DEFAULT_SCREEN_X;
	stack->fb.y		= DEFAULT_SCREEN_Y;

	x = (int) bw_get_framebuffer(&stack->fb);
	if (x == 0)
	{
		for(;;)
		{
			toggle_led(ON);
			for (stack->i = 0; stack->i < 100000; stack->i++) ;
			toggle_led(OFF);
			for (stack->i = 0; stack->i < 100000; stack->i++);
		}
	}



	return 0;
}


static int handle(struct kernel_stack* stack)
{
	(void) stack;
	return 0;
}

