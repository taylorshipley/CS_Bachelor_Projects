#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char *argv[]) {
    int count;
    int num_sets;
    char *priority;

    if(argc < 3){
        printf(1, "Insufficient arguments, expected format: priTest <int> <int>\n");
        exit();
    }

    count = atoi(argv[1]);
    num_sets = atoi(argv[2]);

    for (int j = 0; j < num_sets; j++) {

        int pid = fork();
        if (pid == 0) {
            int init_priority = getpriority();
            printf(1, "Initial Priority: %d\n", init_priority);
            
            if (j % 2 == 0) {
                setpriority(0); // Set priority to highest (0)
                priority = "highPriority";
            } else {
                setpriority(4); // Set priority to lowest (4)
                priority = "lowPriority";
            }

            int final_priority = getpriority();
            printf(1, "Final Priority After Set: %d\n", final_priority);

            for(int i=0; i<count; i++){
                printf(1, "%s, %d\n", priority, i);
            }
            exit();
        } else if (pid < 0) {
            printf(1, "Fork failed\n");
            exit();
        }
    }

    // Call wait for each child created
    for(int i = 0; i < num_sets; i++) {
        wait();
    }

    exit();
}
