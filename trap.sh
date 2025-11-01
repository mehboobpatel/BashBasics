#!/bin/bash

trap 'rm -f log_*.log; echo "Cleanup done!"; exit 1' SIGINT SIGTERM

for i in {1..10}; do
    echo "Creating log file log_$i.log"
    touch "log_$i.log"
    sleep 2
done