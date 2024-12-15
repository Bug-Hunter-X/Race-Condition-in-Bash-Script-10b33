#!/bin/bash

# This script demonstrates a solution to the race condition bug using locks.

# Create two files
touch file1.txt
touch file2.txt

# Use a lock file to synchronize access to file1.txt
function write_to_file1() {
  flock -n 200 file1.lock || exit 1 # Acquire lock, exit if busy
  echo "Process 1 writing to file1.txt"
  echo "Process 1" >> file1.txt
  flock -u 200 file1.lock # Release lock
}

# Use a lock file to synchronize access to file2.txt
function write_to_file2() {
  flock -n 201 file2.lock || exit 1 # Acquire lock, exit if busy
  echo "Process 2 writing to file2.txt"
  echo "Process 2" >> file2.txt
  flock -u 201 file2.lock # Release lock
}

# Start two processes concurrently
(while true; do write_to_file1; sleep 1; done) &
(while true; do write_to_file2; sleep 1; done) &

# Wait for a few seconds
sleep 5

# Print the contents of both files
cat file1.txt
cat file2.txt

# Kill the processes
killall -9 -TERM bash