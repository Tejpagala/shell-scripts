#!/bin/bash

## When you assign a name to set of commands then it is called functions.

# Two ways to define a funtion.

#type1

function sample1() {
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

# Rules for functions

# 1. You can define variables inside a function and vice-versa.
# 2. If you define a variables inside a function as local variables, then you cannot access in a main program.

demo1() {

    a=20
    echo "a in function is ${a}"

}

    echo "a in outside is ${a}"

    demo1