#!/bin/bash

# while [ expression ]; do commands ; done
# while command; do command; done

sleep 100 &

while `ps -ef | grep -sleep | grep -v grep &>/dev/null`
do 
   echo "sleep command is running"
   sleep 20
done