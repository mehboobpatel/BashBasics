#!/bin/bash
name="Maheboob Patel"

# #   - Always quote variables inside [ ] to avoid errors

if [ "$name" = "Maheboob Patel" ]; then
  echo "Match"
fi
#ppose you forget to type a number and just hit Enter:
#If $num is empty, Bash expands that line into: if [ -gt 5 ]; then
