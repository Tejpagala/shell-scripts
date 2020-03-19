#!/bin/bash

## When you assign a name to set of commands then it is called functions.

# Two ways to define a funtion.

#type1

funtion sample1() {
    ls
    cat /etc/passwd | head -1
}

#Type 2

sample2() {
    ls
    cat /etc/passwd | head -1
}

## Access function
sample1
sample2