#include <task.h>
#include <scheduler.h>
#include <raspberrypi.h>
struct kernel_stack
{
	int request;

	struct task *active;

	struct task tasks[NUM_TASKS];
	struct task *task_free_list;

	struct priority_queue priority_queues[NUM_TASKS];
	struct priority_queue *priority_queue_free_list;
	struct priority_queue *schedule[NUM_PRIORITIES];

	

};

static int initialize(struct kernel_stack* stack);

static int handle(struct kernel_stack *stack);

static int get_next_request(struct task **active);


int kernel(void)
{
	struct kernel_stack stack;

	
	initialize(&stack);
	
	do
	{
		stack.request = get_next_request(&stack.active);
		handle(&stack);
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

	initialize_priority_queues(stack->priority_queues, stack->schedule, &stack->priority_queue_free_list);
	initialize_task_structs(stack->tasks, &stack->task_free_list);
	return 0;
}


static int handle(struct kernel_stack* stack)
{
	(void) stack;
	return 0;
}

