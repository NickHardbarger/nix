#!/usr/bin/env bash

name="Nick"
user=$(echo "${HOME/*\/}@")
host=$(hostname -f)

echo "Hello $name!\n"
echo $var$host
echo "-------"

echo "hostname: "
uname -n

echo "arch: "
uname -m

echo "os: "
uname -o

echo "kernel: "
uname -r
