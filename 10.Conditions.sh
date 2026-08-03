#!/bin/bash

#Now do the add even conditions

echo "Please Enter Number : "
read -s -r NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then 
    echo "Given Number is Even Number"
elif [ $(($NUMBER % 2)) -ne 0 ]; then
    echo "Given Number is Odd Number"
else
    echo "Given Number is Prime Number"
fi



if [ $((NUMBER % 2)) -eq 0 ]; then 
    echo "Given Number is Even Number"
elif [ $((NUMBER % 2)) -ne 0 ]; then
    echo "Given Number is Odd Number"
else
    echo "Given Number is Prime Number"
fi