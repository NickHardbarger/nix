#!/usr/bin/env perl

$name = "Nick";
#user=$(echo "${HOME/*\/}@")
#host=$(hostname -f)
#echo $var$host
print "Hello $name!\n";
#system("uname -a"); # all

print "hostname: ";
system("uname -n"); # hostname

print "arch: ";
system("uname -m"); # architecture

print "os: ";
system("uname -o"); # OS

print "kernel: ";
system("uname -r"); # kernel
