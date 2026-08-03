#!/bin/bash

#Now  starts the condtions in shell script
# shortcuts 
# lessthen     ---> -lt  
# greaterthen  ---> -gt 
# notequal     ---> -ne
# equalto      ---> -eq

num=$1

if [ $num -gt 10 ]; then
    echo "Given Number $num is greater then 10"
	exit 1
elif [ $num -lt 10 ]; then
    echo "Given Number $num is less then 10"
	exit 1
else
	echo "Given Number $num is equal to 10"
fi



