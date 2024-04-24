#!/bin/bash

# Define an array of thresholds to test
thresholds=("1" "2" "5" "10" "20" "30" "40" "50" "60" "70" "80" "90" "100")

# Function to run the program and calculate the average time
run_program() {
    # Assign the first function argument to local variable 'threshold'
    local threshold="$1"
    # Initialize a variable to store the total time taken
    local total_time=0

    # Run the program 5 times
    for (( i=1; i<=5; i++ )); do
        # Run the program and capture the output (time taken)
        time_taken=$(./Program07 1000000000 $threshold)
        # Add the time taken to the total time
        total_time=$(echo "$total_time + $time_taken" | bc)
    done

    # Calculate the average time taken over the 5 runs
    average_time=$(echo "scale=2; $total_time / 5" | bc)
    # Print the average time taken with the specific threshold
    echo "Average time taken with threshold $threshold: $average_time seconds"
}

# For each threshold value in the 'thresholds' array
for threshold in "${thresholds[@]}"; do
    # Call the 'run_program' function with the threshold as an argument
    run_program "$threshold"
done