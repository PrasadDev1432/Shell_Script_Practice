#!/bin/bash

# Now Using Spcl_Variables to Practice 

#1. '$0' ---> Meaning: Name of the script (filename).
echo "Script name: $0"

#2. '$1, $2, $3' -----> Meaning: Command line arguments passed to the script.
#git bash ---> sh 07.spcl_Variables.sh Prasad Durga Prasad

echo "First Participate $1"
echo "First Participate $2"
echo "First Participate $3"

#3. '$#'  ---> Meaning: Number of arguments given.
echo "Total args: $#"

# Difference:
# $@ → keeps arguments separate.
# $* → merges them into one string.

#4. $@  ---> Meaning: All arguments as a list (each treated separately).
echo "All variables passed to the script: $@"

#5. $* ----> Meaning: All arguments as a single string.
echo "All variables passed to the script: $@"

#6. $$  ----> Meaning: Process ID (PID) of the running script.
echo "Process ID: $$"

#7. $? ----> Meaning: Exit status of the last command.
# 0 → Success
# Non‑zero → Error
echo "Exit status: $?"

#8. $!  ----> Meaning: PID of the last background process.
sleep 60 &
echo "PID of the last command in background is: $!"

#9. $_  ----->   Meaning: Last argument of the previous command.
echo Hello
echo $_

#10. check Present working Directory 
echo "Current directory: $PWD"

#11. check user who is working
echo "Who is running this: $USER"

#12. check home directory
echo "Home directory of user: $HOME"
