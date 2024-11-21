#!/usr/bin/env bash

# inspired and based on pfetch

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

# \\
#  \\
#  /\\
# // \\
#//   \\

WHITE='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREY='\033[0;90m'

user="$(echo "${HOME/*\/}@")"
host="$(hostname -f)"
nixos="$(cat /etc/os-release | grep PRETTY_NAME | grep -o -P '(?<=").*(?=")')"
model="$(cat /sys/devices/virtual/dmi/id/product_version)"
kernel="$(uname -r)"
nix1="$(nix-store -q --requisites /run/current-system/sw | wc -l)"
nix2="$(nix-store -q --requisites ~/.nix-profile | wc -l)"
pkgs="$(expr $nix1 + $nix2)"
memory="$(free -m | grep Mem | awk '{print $3}')"

echo -en "  \\\\\  \\\\\ //   "
echo -e "${GREEN}$user$host${WHITE}"

echo -en " ==\\\\\__\\\\\/ // "
echo -e "${GREY}https://github.com/NickHardbarger${WHITE}"

echo -en "   //   \\\\\//  "
echo -e "${RED}model:${WHITE}  $model"

echo -en "==//     //== "
echo -e "${BLUE}flake:${WHITE}  $nixos"

echo -en " //\\\\\___//    "
echo -e "${YELLOW}kernel:${WHITE} $kernel"

echo -en "// /\\\\\  \\\\\==  "
echo -e "${CYAN}pkgs:${WHITE}   $pkgs"

echo -en "  // \\\\\  \\\\\   "
echo -e "${PURPLE}memory:${WHITE} $memory Mi"
