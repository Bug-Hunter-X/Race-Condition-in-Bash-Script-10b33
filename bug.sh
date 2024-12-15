#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes concurrently
(while true; do echo "Process 1 writing to file1.txt"; echo "Process 1" >> file1.txt; sleep 1; done) &
(while true; do echo "Process 2 writing to file2.txt"; echo "Process 2" >> file2.txt; sleep 1; done) &

# Wait for a few seconds
sleep 5

# Print the contents of both files
cat file1.txt
cat file2.txt

# Kill the processes (important to avoid endless loops in testing)
killall -9 -TERM bash