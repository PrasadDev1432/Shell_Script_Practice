#!/bin/bash

#Now do the add even conditions


echo "Please Enter Number : "
read -s -r NUMBER

#condition -1 with using inside $ symbal

if [ $(($NUMBER % 2)) -eq 0 ]; then 
    echo "Given Number is Even Number"
elif [ $(($NUMBER % 2)) -ne 0 ]; then
    echo "Given Number is Odd Number"
else
    echo "Given Number is Prime Number"
fi


#condition -2 without using inside $ symbal

if [ $((NUMBER % 2)) -eq 0 ]; then 
    echo "Given Number is Even Number"
elif [ $((NUMBER % 2)) -ne 0 ]; then
    echo "Given Number is Odd Number"
else
    echo "Given Number is Prime Number"
fi