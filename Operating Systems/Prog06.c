#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>

// Global stop flag used to indicate when all threads should stop
volatile int stop_all = 0;

// Recursive function to calculate the nth Fibonacci number
long long fibonacci(int n) {
    if(n == 0) return 0;
    if(n == 1) return 1;
    if(stop_all) pthread_exit(NULL);  // Stop computation if stop_all is set
    return fibonacci(n-1) + fibonacci(n-2);
}

// Function for the Fibonacci calculation thread
void* calculate_fibonacci(void* number) {
    int n = *((int*)number);
    long long result = fibonacci(n);
    if(!stop_all) {
        printf("\nFibonacci(%d) = %lld\n", n, result);
    }
    pthread_exit(NULL);
}

// Function for the name printing thread
void* print_name(void* name) {
    if(stop_all) pthread_exit(NULL);  // Stop operation if stop_all is set
    printf("\nHello there! My name is %s.\n", (char*)name);
    pthread_exit(NULL);
}

// Function for the input thread
void* process_input(void* arg) {
    int choice;
    int fib_number;
    while(1) {
        printf("\nPlease choose from the following menu:\n");
        printf("1 - Print the name\n");
        printf("2 - Compute a Fibonacci number\n");
        printf("3 - Exit the program\n");
        printf("Choice? ");
        scanf("%d", &choice);
        
        if(choice == 1) {
            pthread_t name_thread_id;
            char* name = (char*) arg;
            pthread_create(&name_thread_id, NULL, print_name, name);
        }
        else if(choice == 2) {
            printf("\nWhich Fibonacci number to compute (ex. F(2)=1): ");
            scanf("%d", &fib_number);
            pthread_t fib_thread_id;
            pthread_create(&fib_thread_id, NULL, calculate_fibonacci, &fib_number);
        }
        else if(choice == 3) {
            stop_all = 1;  // Set stop flag to true
            printf("Bye, thanks for your time\n");
            exit(0);  // Immediately exit the program
        }
    }
    return NULL;
}

// Main function
int main() {
    char name[80];
    printf("Please enter your name: ");
    fgets(name, 80, stdin);
    name[strlen(name)-1] = '\0';

    // Start the input processing thread
    pthread_t input_thread_id;
    pthread_create(&input_thread_id, NULL, process_input, name);
    
    // Let the input thread handle everything
    pthread_join(input_thread_id, NULL);

    return 0;
}