#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>

int main(int argc, char *argv[]) {
    clock_t start = clock();
    if (argc != 3) {
        printf("Usage: hw3 <numForks> <fileName>\n");
        return 1;
    }

    int numForks = atoi(argv[1]);
    char *fileName = argv[2];

    if (numForks != 1 && numForks != 4) {
        printf("numForks must be 1 or 4\n");
        return 1;
    }
    
    // Fork 1 or 4 times then call minMax.c
    for (int i = 0; i < numForks; i++) {
        int pid = fork();
        if (pid == -1) {
            perror("fork failed");
            return 1;
        } else if (pid == 0) {
            // Child process
            execl("./minMax", "minMax", fileName, NULL);
            perror("exec failed");
            return 1;
        }
    }

    // Wait for all child processes to finish
    for (int i = 0; i < numForks; i++) {
        wait(NULL);
    }

    // Print my name
    printf("Taylor Shipley\n");
    // Stop the clock & displays time in seconds
    clock_t end = clock();
    double duration = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Time taken: %.2f seconds\n", duration);
    return 0;
}
