#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int 
sys_nice(void) {
  int incr;
  if (argint(0, &incr) < 0)
    return -1;
  struct proc *curproc = myproc();

  int new_priority = curproc->priority + incr;

  if (new_priority < 0 || new_priority > 4)
    return -1; // Priority exceeds the range [0, 4]

  curproc->priority = new_priority;
  return 0; // Successfully changed the priority
}

int 
sys_getpriority(void) {
  struct proc *curproc = myproc();
  return curproc->priority;
}

int 
sys_setpriority(void) {
  int new_priority;
  if (argint(0, &new_priority) < 0)
    return -1;
  struct proc *curproc = myproc();

  if (new_priority < 0 || new_priority > 4)
    return -1; // Invalid priority value

  curproc->priority = new_priority;
  return 0; // Successfully set the new priority
}