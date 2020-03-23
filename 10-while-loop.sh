#!/bin/bash

# while [ expression ]; do commands ; done
# while command; do command; done

n=1

while [ $n -le 5 ]
do 
   echo "welcome $1 time"
   n=$(( n+1 ))
done