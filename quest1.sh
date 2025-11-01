#!/bin/bash
#for printing numbers who are divisible by 6 or divisible by 10 and NOT DIVISIBLE by 20
for i in {1..100};
do
if ([ $(expr $i % 6) == 0 ] || [ $(expr $i % 10) == 0 ]) && [ $(expr $i % 20) != 0 ]
then
echo $i
fi;
done
