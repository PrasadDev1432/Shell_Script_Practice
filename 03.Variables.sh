#!/bin/bash
# Passing the Arguments & #Using User inputs

A=$1
B=$2

read COURSE
read ID
read -s Phn_Number 


echo "$A:: Hi $2, How are you?"
echo "$B:: Hello $A, I am fine. How are you?"
echo "$A:: What are you learning recently? And Suggest on Cource $ID and share ur phn number also"
echo "$B:: I am learning $COURSE $A This is My Phn Numer : $Phn_Number"