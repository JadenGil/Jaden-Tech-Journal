#!/bin/bash

#This code was made by Jaden Gilmond

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <subnet> <port>"
    exit 1
fi
#^This checks if the script is checking the 2 arguments^

subnet=$1
port=$2

echo "host,port"

for host in $(nmap -n -sn $subnet | grep 'report for' | awk '{print $NF}'); do
  timeout .1 bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null &&
    echo "$host,$port"
done
