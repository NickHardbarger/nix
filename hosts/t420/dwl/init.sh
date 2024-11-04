#!/usr/bin/env sh

# executes notification daemon and sets wallpaper
exec mako
exec swaybg -i ~/nil/hosts/t420/wallpapers/stairs.jpg -m fill

# executes foot and emacs daemons
exec foot --server
exec emacs --daemon

# terminates
#exec <&-
