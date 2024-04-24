#include <stdio.h>
#include <pthread.h>
#include <sys/time.h>
#include <stdlib.h>

// Global variable to represent the counter
int global_counter = 0;
// Global variable to store the threshold value
int threshold = 1;

// Mutex for synchronizing access to the global counter
pthread_mutex_t counter_mutex = PTHREAD_MUTEX_INITIALIZER;

// Function to perform the sloppy counter increment
void sloppy_counter(int *local_count) {
    // Increment the local count
    (*local_count)++;
    // Check if the local count has reached the threshold
    if (*local_count >= threshold) {
        // Lock the mutex to safely increment the global counter
        pthread_mutex_lock(&counter_mutex);
        // Increment the global counter by the local counter
        global_counter += *local_count;
        // Unlock the mutex after incrementing the global counter
        pthread_mutex_unlock(&counter_mutex);
        // Reset the local counter
        *local_count = 0;
    }
}

// Function to be run by each thread
void *thread_function(void *arg) {
    // Local counter for this thread
    int local_count = 0;
    // Get the threshold for this thread from the argument
    int thread_threshold = *((int *)arg);
    // Increment the global counter until it reaches the threshold
    while (global_counter < thread_threshold) {
        sloppy_counter(&local_count);
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    // Ensure the correct number of arguments are provided
    if (argc != 3) {
        printf("Usage: %s <target_count> <threshold>\n", argv[0]);
        return 1;
    }

    // Parse the target count and threshold from the command line arguments
    int target_count = atoi(argv[1]);
    int num_threads = 5; // Number of threads to be created
    pthread_t threads[num_threads];

    // Convert the threshold argument to an integer
    threshold = atoi(argv[2]);

    // Timeval structs to measure the time taken
    struct timeval start_time, end_time;

    // Get the current time as the start time
    gettimeofday(&start_time, NULL);

    // Create the threads
    for (int i = 0; i < num_threads; i++) {
        // Create a new thread that will run the 'thread_function'
        if (pthread_create(&threads[i], NULL, thread_function, (void *)&target_count) != 0) {
            perror("Thread creation failed");
            return 1;
        }
    }

    // Wait for all the threads to finish
    for (int i = 0; i < num_threads; i++) {
        pthread_join(threads[i], NULL);
    }

    // Get the current time as the end time
    gettimeofday(&end_time, NULL);

    // Calculate and print the time taken
    double time_taken = (end_time.tv_sec - start_time.tv_sec) + 
                        (end_time.tv_usec - start_time.tv_usec) / 1e6;

    printf("%.6f\n", time_taken);
    return 0;
}