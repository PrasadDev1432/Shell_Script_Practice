#!/bin/bash

# everything in shell is considerd as string

#📌 Shell Script Data Types

# 1. String ---->  Default type for all variables.
name="Prasad"
echo $name

#2. Integer -------> Used for arithmetic operations.
num=10
echo $((num + 5))

#3. Float/Decimal  --------> Shell doesn’t support floats directly. You need bc or awk.
echo "10.5 + 2.3" | bc
awk 'BEGIN {print 10.5 + 2.3}'

#4. Boolean    --------> Represented using true or false (exit codes).
if true; then
  echo "Yes"
fi

#5. Character  ------> Treated as a string of length 1.
char="A"
echo $char

#6. Array  -----> Indexed collections of strings.
arr=("Linux" "Shell" "Docker")
echo ${arr[0]}   # Linux
echo ${arr[@]}   # All elements

#7. Environment Variables  --------> Special variables available system-wide.
echo $HOME
export COURSE="DevOps"

echo $COURSE