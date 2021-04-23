#!/bin/bash

#task 1.1

if [[ $EUID -ne 0 ]]; 
then
echo "ROOT RUN THIS SCRIPT"
fi
