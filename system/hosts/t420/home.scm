;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
	     (gnu home services)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
 (packages (specifications->packages
	    (list "btop"
		  "nyxt")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (append (list (service home-bash-service-type
                          (home-bash-configuration
                           (aliases '(("l" . "ls -Ahgo --color=auto --group-directories-first")))
			   (bash-profile (list (plain-file "bash-profile"
							   (string-append
							    ;; Script put me in root directory lol
							    ;; Weird bug
							    "#~/nix/system/hosts/t420/font-cursor\n"
							    "wlstat | dwl -s 'swaybg -i ~/nix/system/wallpapers/columbus.jpg <&-'\n"))))
                           (bashrc (list (plain-file "bashrc"
						     (string-append
						      "GUIX_PROFILE='/home/nh/.config/guix/current'\n"
						      ". $GUIX_PROFILE/etc/profile\n"
						      "export PS1='\\[\\e[1;34m\\]\\w \\[\\e[91m\\]\\]() \\[\\e[0m\\]󰘧 '\n"
						      "nixfetch\n"))))))
		 (service home-xdg-configuration-files-service-type
			  `(("nyxt/config.lisp" ,(local-file "../../nyxt/config.lisp")))))
           %base-home-services)))
