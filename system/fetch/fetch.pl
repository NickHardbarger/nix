#!/usr/bin/env perl

$name = "Nick";
print "Hello $name!\n";

print "hostname: ";
system("uname -n"); # hostname

print "arch: ";
system("uname -m"); # architecture

print "os: ";
system("uname -o"); # OS

print "kernel: ";
system("uname -r"); # kernel
