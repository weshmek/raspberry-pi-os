#include <task.h>


int initialize_task_structs(struct task* tasks, struct task** free_list)
{
	int i;
	for (i = 0; i < NUM_TASKS; i++)
	{
		tasks[i].tid = i;
		tasks[i].next_free = tasks + i + 1;
	}
	tasks[NUM_TASKS - 1].next_free = 0;
			
	return 0;
}


struct task* get_new_task_struct(struct task** free_list)
{
	struct task* ret = *free_list;
	if (ret == 0)
	{
		return 0;
	}

	*free_list = (*free_list)->next_free;
	return ret;
}	


int done_with_task(struct task* tsk, struct task** free_list)

{
	if (tsk == 0)
	{
		return -1;
	}
		
	tsk->next_free = *free_list;
	*free_list = tsk;
	return 0;
}
