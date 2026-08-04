#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

Checking(){
    if [ $1 -ne 0 ]; then
        dnf install $2 -y
        Validate $? $2
    else
        echo -e " $G $2 Already Installed $N Now $R Removing this Installed Software $N "
		dnf remove -y $2
    fi
}

dnf list installed mysql
Checking $? "mysql"

dnf list installed nginx
Checking $? "nginx"

dnf list installed python3
Checking $? "python3"
