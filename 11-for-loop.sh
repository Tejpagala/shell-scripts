#!/bin/bash

# for variables in inputs ; do command ; done

for ip in google.com gmail.com facbook.com ; do
   ping -c 2 $ip
   if [ $? -eq 0 ]; then
      echo "ping $ip:: success"
   else 
      echo "ping $ip :: Not Success"
    fi

done