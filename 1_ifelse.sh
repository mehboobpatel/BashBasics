#!/bin/bash
echo "Enter a Num A"

read num
echo "enter a Num B"
read num2
# [ ] is used for comparison operators in str
# also white space between brackets is mandatory
# you have to use ; for having then in the same line
if [ $num -gt $num2 ] ; then
echo "A is greater"
elif [ $num -eq $num2 ]
then
echo "A is equal to B"
# else
# echo "B is greater"
fi

#FOR Arithemetic operation you have to use (()) you cannot use [ ] for that	
if (($num >= 0)); then

#SPACE is NOT mandatory inside (()) 
#NO need to mention $ before variable name inside (()) 
#Because inside (( )), Bash knows everything is numeric and won’t split or expand values.
if ((num ==0 )); then
	echo "A Number equals zero"
elif (( $num < 0 )); then
echo "numberA is negative"
else
echo "number A is positive"
fi
fi

