#!/bin/bash

#task 1.3

if read -t 5 -p "Hello, what is your name:" NAME
then echo "Hello $NAME"
else 
echo "Time is up, please try again later"
fi
