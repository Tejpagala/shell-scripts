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
a = 20
b = 20

if [ ${a} == ${b} ]
   
   # print this statement
   echo "a is equal to b"

   else
   echo "a is not equal to b"

fi