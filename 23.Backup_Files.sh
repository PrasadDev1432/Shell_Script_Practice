#!/usr/bin/bash

source_dir="$PWD/app_log"

if [ -d "$source_dir" ]; then
    echo "Folder already exists"
else
    echo "Folder does not exist, creating..."
    mkdir -p "$source_dir"
fi

touch -d "20 days ago" "$source_dir"/{app,catalogue,mongodb,user,cart,redis,rabbitmq,mysql,dispatch,payment,frontend,shipping}.log