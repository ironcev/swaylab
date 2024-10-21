#!/bin/bash

# Capture the start time
start_time=$(date +%s)

# Define the number of iterations
max_count=1000000

# Define the directory to store output files
output_dir="./output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop from 1 to max_count
for (( i=1; i<=max_count; i++ ))
do
    # Format the counter with leading zeros to 9 digits
    filename=$(printf "%09d.txt" $i)

    # Run the command and redirect the output to the corresponding file
    ./forc build --no-encoding-v1 --release > "$output_dir/$filename"

    # Optionally, print the progress (uncomment the next line if needed)
    # echo "Generated: $filename"
done

# Capture the end time
end_time=$(date +%s)

# Calculate and display the total execution time
execution_time=$((end_time - start_time))
echo "Script execution time: $execution_time seconds"

