#!/bin/bash

# for variables in inputs ; do command ; done

for ip in google.com gmail.com facebook.com ; do
   ping -c 2 $ip &>/dev/null
   if [ $? -eq 0 ]; then
      echo "ping $ip:: success"
   else 
      echo "ping $ip :: Not Success"
    fi

done