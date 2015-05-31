#ifndef __SCHEDULER_H__
#define __SCHEDULER_H__
#define NUM_PRIORITIES	15
struct task;

struct	priority_queue
{
	struct task *tsk;
	struct priority_queue *next;
	struct priority_queue *last;
	struct priority_queue *next_free;
};


int initialize_priority_queues(struct priority_queue *queue_list, struct priority_queue** scheduler, struct priority_queue** free_list);




struct task* schedule(struct task* active, struct priority_queue** queues, struct priority_queue** free_list);




 


#endif

