#include "syscall.h"
#include "types.h"   
#include "user.h"    
#include "fcntl.h" 

int main(int argc, char *argv[]){
    int magic; // variable to store the magic number

    magic = getMagic();
    printf(1, "current magic number is the following: %d\n",magic);

    incMagic(3);  // increment the magic number by 3

    magic = getMagic();
    printf(1, "current magic number is the following: %d\n",magic);

    // now check the system calls for process name
    printf(1, "current process name:");

    getProcName();  // getProcName should print the name to the screen

    printf(1,"\n");  // still need a new line

    modProcName("newName");  // now change the proc name to newName

    printf(1,"The process name is now: ");
    getProcName();
    printf(1,"\n");

    magic = getMagic();
    printf(1, "current magic number is the following: %d\n",magic);

    // Now change the magic number back to what is was by incrementing
    // by -3
    incMagic(-3);

    magic = getMagic();
    printf(1, "current magic number is the following: %d\n",magic);

    exit();
}