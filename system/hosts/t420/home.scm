;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
 (packages (cons* btop
		  nyxt))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (append (list (service home-bash-service-type
                          (home-bash-configuration
			   (environment-variables '(("PS1" . "\[\e[1;34m\]\w \[\e[91m\]\]($(git branch --show-current 2>/dev/null)) \[\e[0m\]󰘧 ")
						    ("EDITOR" . "emacs")))
                           (aliases '(("l" . "ls -Ahgo --color=auto --group-directories-first")))
                           (bashrc "nixfetch")
                           (bash-profile "startwl"))))
           %base-home-services)))
