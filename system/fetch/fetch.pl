#!/usr/bin/env perl

# inspired and based on pfetch

$user = system("${HOME/*\/}@");
$host = system(hostname -f);
print "$user$host\n";
