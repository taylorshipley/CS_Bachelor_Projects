#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char *argv[]) {
    int count;
    char *priority;
    int initial_priority, final_priority;

    if(argc < 3){
        printf(1, "Insufficient arguments, expected format: priCount <int> <priority>\n");
        exit();
    }

    count = atoi(argv[1]);
    priority = argv[2];

    if (strcmp(priority, "highPriority") == 0) {
        setpriority(0); // Set priority to highest (0)
    } else if (strcmp(priority, "lowPriority") == 0) {
        setpriority(4); // Set priority to lowest (4)
    }

    // Get and print the initial priority
    initial_priority = getpriority();
    printf(1, "Initial Priority: %d\n", initial_priority);

    // Increase the priority by 1 (if not already at 4)
    if (initial_priority != 4) {
        nice(1);
    }

    // Get and print the final priority
    final_priority = getpriority();
    printf(1, "Final Priority After Nice: %d\n", final_priority);

    for(int i=0; i<count; i++){
        printf(1, "%s, %d\n", priority, i);
    }
    exit();
}
