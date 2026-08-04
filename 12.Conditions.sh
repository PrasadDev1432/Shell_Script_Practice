#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo "$R ERROR:: Please run this script with root privelege $N "
	exit 1
elif [ $USERID -eq 0 ]; then
    dnf install mysql -y
	echo " $G Installation MySQL is Success"
	exit 1
else 
   echo "Status Success"
fi


























if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MySQL is failure"
    exit 1
else
    echo "Installing MySQL is SUCCESS"
fi