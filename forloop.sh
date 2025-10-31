#!/bin/bash
IFC=3

for((i=$IFC ; i<=10 ; i+=2))
do 
touch $i.txt
done
