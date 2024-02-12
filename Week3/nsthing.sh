#!/bin/bash

# Code made by Jaden Gilmond

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <network_prefix> <dns_server>"
    exit 1
fi

network_prefix="$1"
dns_server="$2"

# Loop through all IP addresses in the /24 network
for ((i=1; i<=254; i++)); do
    ip_address="$network_prefix.$i"
    # Perform DNS lookup using specified DNS server
    result=$(dig +short @"$dns_server" -x "$ip_address")
    if [ -n "$result" ]; then
        echo "IP Address: $ip_address - Hostname: $result"
    fi
done
