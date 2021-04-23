#!/bin/bash

#Task 1.8

RANDOM=$$

PIPS=6
MAXTHROWS=700
THROW=0

ZEROES=0
ONES=0
TWOS=0
THREES=0
FOURS=0
FIVES=0
SIXES=0

print_result ()
{
echo "единиц = $ONES"
echo "двоек = $TWOS"
echo "троек = $THREES"
echo "четверок = $FOURS"
echo "пятерок = $FIVES"
echo "шестерок = $SIXES"
}

update_count ()
{
case "$1" in
  0) let "ONES += 1";;
  1) let "TWOS += 1";;
  2) let "THREES += 1";;
  3) let "FOURS += 1";;
  4) let "FIVES += 1";;
  5) let "SIXES += 1";;
esac
}

echo


while [ "$THROW" -lt "$MAXTHROWS" ]
do
  let "GAME = RANDOM % $PIPS"
  update_count $GAME
  let "THROW += 1"
done

print_result
