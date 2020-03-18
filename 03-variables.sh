#!/bin/bash

# what is a variable 

# When you assign a name to any data, Then it is called a variable.

# syntax
# VAR = DATA

NAME=TEJA
AGE=25
DATE=18-03-2020

echo "Hello, My name is ${NAME}"
echo "and my age is ${AGE}"
echo "Today date is ${DATE}"

# In the above case date should be dynamically assigned and not by manually as the same code if you execute tomorrow, The code will be wrong.

#syntax is VAR=$(DATE +%F)

DATE=$(date +%F)

echo "Hello Very Good Morning, Today date is ${DATE}"

## Arthimetic substitution 

a=10
b=20
c=(($a+$b))

echo "sum of $a and $b is ${c}"


 