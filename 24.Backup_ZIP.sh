#!/usr/bin/bash

G="\e[32m"
Y="\e[33m"
N="\e[0m"

Source_Dir="$PWD/Log_files"
Dest_Dir="$PWD/Backup_Log_files"

# Source directory
if [ ! -d "$Source_Dir" ]; then
    echo -e "${Y}$Source_Dir does not exist, creating...${N}"
    mkdir -p "$Source_Dir"
else
    echo -e "${G}$Source_Dir already exists${N}"
fi

# Destination directory
if [ ! -d "$Dest_Dir" ]; then
    echo -e "${Y}$Dest_Dir does not exist, creating...${N}"
    mkdir -p "$Dest_Dir"
else
    echo -e "${G}$Dest_Dir already exists${N}"
fi

# Create 20 days old files
touch -d "20 days ago" "$Source_Dir"/{app,mongodb,user,cart,catalogue,mysql,shipping,payment,dispatch,frontend,redis,rabbitmq}.log

# Create 20 current date log files
touch "$Source_Dir"/app{1..20}.log

# Find old logs -> ZIP -> if ZIP success delete old logs
find "$Source_Dir" -type f -name "*.log" -mtime +19 |
zip -j "$Source_Dir/Source_zip.zip" -@ &&
find "$Source_Dir" -type f -name "*.log" -mtime +19 -delete



# Move ZIP file to Backup directory
find "$Source_Dir" -type f -name "*.zip" -exec mv {} "$Dest_Dir/" \;



