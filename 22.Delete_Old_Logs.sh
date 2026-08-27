#!/usr/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

set -e

trap 'echo "ERROR at line: $LINENO | Command: $BASH_COMMAND"' ERR

SOURCE_DIR="/home/ec2-user/app_logs"
DEST_DIR="/home/ec2-user/backupfiles"

mkdir -p "$DEST_DIR"

echo "Destination Directory: $DEST_DIR"
echo -e "Script Executed at: ${Y}$(date)${N}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${R}ERROR:: $SOURCE_DIR does not exist${N}"
    exit 1
fi

FILES_TO_DELETE=$(find "$SOURCE_DIR" -type f -name "*.log" -mtime +19)

if [ -z "$FILES_TO_DELETE" ]; then
    echo -e "${Y}No log files found older than 20 days${N}"
    exit 0
fi

printf '%s\n' "$FILES_TO_DELETE"

while IFS= read -r filepath
do
    if cp -f "$filepath" "$DEST_DIR/"; then

        echo -e "${G}Copied ....................................successfully: $filepath${N}"

        echo -e "${Y}Deleting the file: $filepath${N}"

        if rm -f "$filepath"; then
            echo -e "${G}Deleted ...............................successfully: $filepath${N}"
        else
            echo -e "${R}Deleting file FAILED: $filepath${N}"
        fi

    else
        echo -e "${R}Copy FAILED. File will NOT be deleted: $filepath${N}"
    fi

done <<< "$FILES_TO_DELETE"






















#!/usr/bin/bash

# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# set -e

# trap 'echo error line : "$LINENO" Error Code : "$BASH_COMMAND" ' ERR

# SOURCE_DIR="$PWD/app_log"
# DEST_DIR="$PWD/backup"

# mkdir -p "$DEST_DIR"

# echo "Destination Directory: $DEST_DIR"
# echo -e "Script Executed at: ${Y}$(date)${N}"

# if [ ! -d "$SOURCE_DIR" ]; then
#     echo -e "${R}ERROR:: $SOURCE_DIR does not exist${N}"
#     exit 1
# fi

# FILES_TO_DELETE=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +19)

# printf '%s\n' "$FILES_TO_DELETE"

# while IFS= read -r filepath
# do
#     if [ -n "$filepath" ]; then

#         cp -f "$filepath" "$DEST_DIR"

#         if [ "$?" -eq 0 ]; then

#             echo -e "${G}Copied successfully: $filepath${N}"

#             echo -e "${Y}Deleting the file: $filepath${N}"

#             rm -f "$filepath"

#             if [ "$?" -eq 0 ]; then
#                 echo -e "${G}Deleted successfully: $filepath${N}"
#             else
#                 echo -e "${R}Deleting file FAILED: $filepath${N}"
#             fi

#         else
#             echo -e "${R}Copy FAILED. File will NOT be deleted: $filepath${N}"
#         fi

#     else
#         echo -e "${Y}No log files found older than 1 day${N}"
#     fi

# done <<< "$FILES_TO_DELETE"