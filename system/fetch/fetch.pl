#!/usr/bin/env perl

$name = "Nick";

print "Hello $name!\n";
#system("uname -a"); # all
print "hostname: ";
system("uname -n"); # hostname
print "os: ";
system("uname -o"); # OS
print "kernel: ";
system("uname -r"); # kernel
