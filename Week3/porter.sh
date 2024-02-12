#!/bin/bash

#This code was made by Jaden Gilmond

subnet="10.0.5"

echo "ip,port"

for i in {1..254}; do
    host="$subnet.$i"
    port="53"
    timeout .1 bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null &&
        echo "$host,$port"
done
