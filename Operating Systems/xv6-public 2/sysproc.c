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
sys_incMagic(void)
{
  int value;
  if (argint(0, &value) < 0)
    return -1;
  cli(); // Disable interrupts
  mycpu()->magic += value;
  sti(); // Re-enable interrupts
  return 0;
}

int 
sys_getMagic(void)
{
    cli(); // Disable interrupts
    int magicNum = mycpu()->magic;
    sti(); // Re-enable interrupts
  return magicNum;
}

int 
sys_getProcName(void)
{
  struct proc* p = myproc();
  cprintf("%s\n", p->name);
  return 0;
}

int 
sys_modProcName(void)
{
  int address;
  if (argint(0, &address) < 0)
    return -1;

  char* charPtr = (char*)address;
  struct proc* p = myproc();
  strncpy(p->name, charPtr, sizeof(p->name) - 1);
  p->name[sizeof(p->name) - 1] = '\0';  // Added lines
  
  return 0;
}