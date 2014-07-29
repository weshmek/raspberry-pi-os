#ifndef __TASK_H__
#define __TASK_H__

#define NUM_TASKS 100
#define TASK_STACK_SPACE 1024


struct task
{
	int tid;
	int parent_tid;
	int priority;
	void* program_counter;
	unsigned int stack_pointer;
	unsigned int task_psr;

	unsigned int stack_space[TASK_STACK_SPACE];

	struct task *next_free;
		
};


int initialize_task_structs(struct task* tasks, struct task **free_list);

struct task* get_new_task_struct(struct task** free_list);

int done_with_task(struct task* tsk, struct task** free_list);

#endif
