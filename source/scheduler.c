#include <scheduler.h>
#include <task.h>
#define NUM_PRIORITY_QUEUES NUM_TASKS

int initialize_priority_queues(struct priority_queue * queues, struct priority_queue** scheduler, struct priority_queue ** free_list)
{
	
	int i;
	for (i = 0; i < NUM_PRIORITY_QUEUES; i++)
	{
		queues[i].next_free = queues + i + 1;
	}
	queues[NUM_PRIORITY_QUEUES - 1].next_free = 0;
	*free_list = queues + 0;
	return 0;
}



static struct task* get_first_task(struct priority_queue** queues, struct priority_queue** free_list)
{

	int i;
	struct priority_queue* tmp;
	struct task* ret = 0;
	for (i = 0; i < NUM_PRIORITIES; i++)
	{
		tmp = queues[i];
		if (tmp == 0)
		{
			continue;
		}
	
		ret = tmp->tsk;
		if (queues[i]->next != 0)
		{
			queues[i] = tmp->next;
			queues[i]->last = tmp->last;
		}
		else
		{
			queues[i] = 0;
		}
		
		tmp->next_free = *free_list;
		*free_list = tmp;


	}
	return ret;
}


static int add_task_to_schedule(struct task* tsk, struct priority_queue** queues, struct priority_queue** free_list)
{
	struct priority_queue* add_to;
	struct priority_queue* new = *free_list;
	if (new == 0)
	{
		return -1;
	}
	
	*free_list = (*free_list)->next_free;

	new->tsk = tsk;
	add_to = queues[tsk->priority];
	
	add_to->last->next = add_to->last = new->last = new;
	new->next = 0;

	return 0;

}


struct task* schedule(struct task* tsk, struct priority_queue** queues, struct priority_queue** free_list)
{
	struct task* ret;
	int x;
	x = add_task_to_schedule(tsk, queues, free_list);
	if (x != 0)
	{
		return 0;
	}
	
	ret = get_first_task(queues, free_list);
	
	return ret;
}

