#!/bin/bash

#TAsk 1.5

until [ -z "$1" ] 
do
  echo -n "$1 "
  shift
done
echo              
exit 0
