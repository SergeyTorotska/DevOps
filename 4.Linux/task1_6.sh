#!/bin/bash

#this script is for defining the character class
#task №1.6

read -n 1 -p "Please, enter symbol:" SYMBOL
case "$SYMBOL" in
[[:digit:]] ) 
          echo " number"
          ;;
[[:space:]] ) 
          echo " spacing"
          ;;
[[:upper:]] ) 
          echo " uppercase"
          ;;
[[:lower:]] ) 
          echo " lowercase"
          ;;
[[:punct:]] )
          echo " punctuation mark"
          ;;
esac 

