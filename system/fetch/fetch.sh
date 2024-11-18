#!/usr/bin/env bash

name="Nick"
user=$(echo "${HOME/*\/}@")
host=$(hostname -f)
arch=$(uname -m)
os=$(uname -o)
kernel=$(uname -r)
    
echo "Hello $name!"
#echo "$user$host"
#echo "-------"
echo "host: $user$host"
echo "system: $arch $os"
echo "kernel: $kernel"
