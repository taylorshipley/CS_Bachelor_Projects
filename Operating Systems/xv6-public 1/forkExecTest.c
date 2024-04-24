#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char *argv[]) {
    int pid;
    char *args[4];

    if (argc < 2) {
        printf(1, "Insufficient arguments, expected format: forkExecTest <int> [<int>]\n");
        exit();
    }

    args[0] = "count";
    args[3] = 0;

    int num_children = ((argc == 3) ? atoi(argv[2]) : 2);

    for (int i = 0; i < num_children; i++) {
        pid = fork();
        if (pid == 0) {
            args[1] = argv[1];
            args[2] = (i % 2 == 0) ? "highPriority" : "lowPriority";
            exec("count", args);
            printf(1, "Exec failed\n");
            exit();
        } else if (pid < 0) {
            printf(1, "Fork failed\n");
            exit();
        }
    }

    // Call wait for each child created
    for(int i = 0; i < num_children; i++) {
        wait();
    }

    exit();
}
