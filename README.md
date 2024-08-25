# nicksOS
nicksOS, or as I've taken to calling it, GNU/Linux/Systemd/Nix/Sway, is the current working name for my own custom configuration of NixOS.
Built around a core of GNU, Linux, SystemD, and Nix, nicksOS primarily uses Sway as its Wayland compositor, although I also have plans to try out other compositors/window managers,
such as qtile, xmonad, and dwm. For its editor, nicksOS currently uses a Neovim distro powered by Nix, called Nixvim. It's fully configured, and right now I'm working on migrating away
from it towards Emacs. nicksOS is currently built around the stable Linux kernel, and I'm looking at the zen and hardened kernels as potential replacements. nicksOS also uses systemd-boot
as its bootloader to ensure full use of SystemD. nicksOS is built with AMD gpus in mind, and uses a patched st as its terminal. nicksOS has full disk encryption, and lacks a display manager.
To execute Sway, type exec sway in the tty. This ensures that the user is logged out of the tty while in a graphical session. nicksOS is currently used as a general purpose desktop, although
I have plans to modularize it. I plan on having one configuration for productivity, and one specifically for gaming.
