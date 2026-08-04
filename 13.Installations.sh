#!/bin/bash

UID=$(id -u)

if [ $UID -ne 0 ]; then
    echo "Error:: Please run this script with root privalege"
	exit 1
fi


Validate(){
    if [ $? -ne 0 ]; then
	    echo "ERROR:: Installing $2 is failure "
		exit 1
	else
		echo "Installation $2 is SUCCESS"
	fi
}

dnf install mysql -y
Validate $? "MySQL"

dnf install nginx -y
Validate $? "Nginx"

dnf install python3 -y
Validate $? "Python"


