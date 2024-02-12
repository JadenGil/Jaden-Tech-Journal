#!/bin/bash

output_file="sweep.txt"

for ((i=2; i<50; i++)); do
    ip="10.0.5.$i"
    if ping -c 1 -W 1 $ip &> /dev/null; then
	echo "this ip: $ip is up" >> $output_file
    fi
done
