#!/bin/bash

# Declaration & Access the Variable
NAME="Prasad"
AGE=24
CITY="Machilipatnam"

echo " My Name Is : $NAME ; I am $AGE yrs old ; I am From $CITY"


# User Input
R="\e[31m"
N="\e[37m"
 
# shellcheck disable=SC2034
read -r usercolor 

echo "My Shirt Clolor : $R usercolor $N"