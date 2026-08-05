#!/bin/bash

USERID=$(id -u)

R="\e[31m"
# G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ "$USERID" -ne 0 ]; then
    echo -e " ${R} ERROR:: Please run this script with root privelege ${N} "
    exit 1
fi

Validate(){
    if [ "$1" -ne 0 ]; then
        echo "ERROR:: Installing $2 is FAILURE "
        exit 1
    else
        echo "Installation $2 is SUCCESS"
    fi
}

Checking(){
    if [ "$1" -eq 0 ]; then
        dnf remove "$2" -y
        Validate $? "$2"
    else
        echo -e " $Y $2 Already Installed Please Skip this Software Installation $N "
    fi
}

dnf list installed mysql
Checking $? "mysql"

dnf list installed nginx
Checking $? "nginx"

dnf list installed python3
Checking $? "python3"
