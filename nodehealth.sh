#!/bin/bash

###Author : Maheboob Patel
## Descritption : Node(VM) Health 
set -x # Enable debugging like verbose
set -e # Exit immediately if a command has error
set -o pipefail # Return exit status of the last command in the pipe that failed
bakuisland| echo "this passed"  
echo " Disk Usage"
df -h

echo " Memory Usage"
free -h

echo " No. Of CPU Cores"
nproc

echo "PID of Docker Process"
ps -aux | grep docker | awk -F" " '{print $2}'

