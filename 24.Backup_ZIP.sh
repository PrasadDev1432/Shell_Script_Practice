#!/usr/bin/bash

Y="\e[33m"
N="\e[0m"
Source_Dir="$PWD/Log_files"
Dest_Dir="$PWD/Backup_Log_files"

if [ ! -d "$Source_Dir" ]; then
    echo -e " $Y  ............................$Source_Dir does not exist $N"
    exit 1
fi

touch -d "20days ago" "$Source_Dir"/{app,mongodb,user,cart,catalogue,mysql,shipping,payment,dispatch,frontend,redis,rabbitmq}.log

touch "$Source_Dir"/app{1..20}.log

find "$Source_Dir" -type f -name "*.log" -mtime +19 | zip -j Source_zip.zip -@ && find "$Source_Dir" -type f -name "*.log" -mtime +19 -delete

find "$Source_Dir" -type f -name "*.zip" -exec mv {} "$Dest_Dir/" \;
