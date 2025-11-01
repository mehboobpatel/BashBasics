#!/bin/bash

word="misssiing ass"

echo "$word" | grep -o "s" | wc -l

#same like above You can use <<< to pass a string to a command
grep -o "s" <<< $word | wc -l
#-o stands for only matching part of the line
