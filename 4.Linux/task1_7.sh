#!/bin/bash

#Task 1.7

read -p "ENTER METERS=" METERS
MATH=$((${METERS}00*62/100000))
echo "MILE=${MATH:0:-2}.${MATH: -2}"

