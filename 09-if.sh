#!/bin/bash

# if statements uses expressions 
#  and expressions are given in [ expression ]

# Expressions are catogorized into three types.
#1. string tests
#  = , == , !=   [ abc = abc ], [ abc == abc ], [ abc != abc ]
#2. Number tests
# -eq, -ne , -gt, -ge, -lt, -le [ 1 -eq 0 ]
#3. file tests.

# if command is generally seen in three forms.
#1. simple-If
#2. If-else
#3. Else-if

# common example for If-else
# access variables.

action=$1

if [ "${action}" = "start" ]; then
   echo "performig start action"
elif [ "${action}" = "stop" ]; then
   echo "performing stop action"
else 
   echo "input needed start/stop"
   exit 1
fi