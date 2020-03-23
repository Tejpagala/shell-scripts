#!/bin/bash

# while [ expression ]; do commands ; done
# while command; do command; done

sleep 50 &

while `ps -ef | grep -sleep | grep -v grep &>/dev/null`
do 
   echo "sleep command is running"
   sleep 5
done