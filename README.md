# Race Condition in Bash Script
This repository demonstrates a race condition bug in a bash script.

## Description
The script launches two processes that concurrently write to two different files. Due to the asynchronous nature of these processes, there's a race condition that results in potentially incomplete or unpredictable file content.

## How to Reproduce
1. Clone this repository.
2. Run the script using `./bug.sh`.
3. Observe the output of the script, noting potential inconsistencies.

## Solution
The race condition can be mitigated by using proper synchronization mechanisms, such as locks or semaphores, to ensure that only one process is writing to a file at any given time. A proposed solution is available in `bugSolution.sh`.

## Note:
The script includes a `killall` command to gracefully terminate processes and prevent endless loops. Remember to run this script in a controlled environment.