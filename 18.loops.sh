#!/bin/bash

#Shell-Script Basic For Loop Function
# for i in {1..20}
# do
#    ech0 "$i"
# done

# Implimate the for loop in installation coding

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
# to create a folder in server using mkdir -p "/var/log/shell-script"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #/var/log/shell-scrpiting/16-Logs.log

mkdir -p $LOGS_FOLDER

echo "Script Started executed at : $(date)" | tee -a "$LOGS_FILE"

if [ "$USERID" -ne 0 ]; then
	echo -e " ${R} ERROR:: Please run this script with root privelege ${N} " | tee -a "$LOGS_FILE"
	exit 1
fi


Validate() {
    if [ "$1" -ne 0 ]; then
	    echo "ERROR:: Installing $2 is FAILURE " | tee -a "$LOGS_FILE"
		exit 1
	else
		echo -e " $G Installation $2 is SUCCESS $N " | tee -a "$LOGS_FILE"
	fi
}

Checking(){
    if [ "$1" -ne 0 ]; then
        dnf install "$2" -y &>>"$LOGS_FILE"
        Validate $? "$2"
    else
        echo -e " $Y $2 Already Installed Please ....................................................................Skip this Software Installation $N " | tee -a "$LOGS_FILE"
    fi
}


for instance in "$@"
do
    dnf list installed "$instance" &>>"$LOGS_FILE"
    Checking $? "$instance"
done


# dnf list installed nginx &>>"$LOGS_FILE"
# Checking $? "nginx"

# dnf list installed redis &>>"$LOGS_FILE"
# Checking $? "redis"
