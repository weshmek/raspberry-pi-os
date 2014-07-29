#include <task.h>
#include <raspberrypi.h>

void stmfd_sp_bang_r0_to_r12_and_r14(void);
int activate(struct task* active)
{

	stmfd_sp_bang_r0_to_r12_and_r14();
}

