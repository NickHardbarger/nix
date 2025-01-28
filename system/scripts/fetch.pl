#!/usr/bin/env perl

use strict;
use warnings;
use Term::ANSIColor;
# inspired and based on pfetch

## ASCII ART DESIGNS ##

#  \\  \\ //
# ==\\__\\/ //
#   //   \\//
#==//     //==
# //\\___//
#// /\\  \\==
#  // \\  \\

# \\
# /\\
#// \\

# \\ //
# /\\/
#// \\

#\\ //\\
# \\/ /\\
#  \\// \\
#my $user = `echo "${HOME/*\/}@"`;
#my $host = `hostname -f`;

#print color('bold magenta');
#print " \\\\ //\n";
#print " /\\\\/ TODO: learn perl\n";
#print "// \\\\ TODO: finish this script\n";
#print color('reset');

my $str1 = `nix-store -q --requisites /run/current-system/sw`;
my $num1 = () = $str1 =~ /\n/g;
my $str2 = `nix-store -q --requisites ~/.nix-profile`;
my $num2 = () = $str2 =~ /\n/g;
#print $user$host
my $count = $num1 + $num2;
print $count;
