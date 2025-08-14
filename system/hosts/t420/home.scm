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
	    (list 
	     ;; CLI UTILS ;;
	     "git"
	     "wl-clipboard"
	     "btop" ; need to configure
	     "wget"
	     "pciutils" ; lspci
	     "mpv"
	     "ffmpeg"
	     "speedtest-cli"
	     "pandoc"
	     "tree"
	     
	     ;; WAYLAND UTILS ;;
	     "swaybg"
	     "grim"
	     "slurp"
	     "mako"
	     "foot"
	     
	     ;; GENERAL GUI ;;
	     ;; "nyxt"
	     ;; Guix packages nyxt 3.11.7, which is broken for me
	     ;; Using 3.12 (via Nix) seems to work just fine, but I couldn't build it with Guix
	     "qutebrowser"
	     "steam" ; Nonguix
	     
	     ;; EMACS ;;
	     "emacs-pgtk"
	     "emacs-geiser-guile"
	     "ccls" ; C LSP
	     "gopls" ; Go LSP
	     "java-eclipse-jdt-core" ; Java LSP
	     "omnisharp" ; Nonguix C# LSP
	     )))

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
						      "clear\n" ;; HACK: hide setlocale error
						      "nixfetch\n"))))))
		 (service home-xdg-configuration-files-service-type
			  `(("nyxt/config.lisp" ,(local-file "../../nyxt/config.lisp"))
			    ("nyxt/theme.lisp" ,(local-file "../../nyxt/theme.lisp"))
			    ("foot/foot.ini" ,(local-file "./config/foot/foot.ini"))
			    ("git/config" ,(local-file "./config/git/config"))
			    ("mako/config" ,(local-file "./config/mako/config"))
			    ("qutebrowser/config.py" ,(local-file "./config/qutebrowser/config.py"))
			    ("qutebrowser/quickmarks" ,(local-file "./config/qutebrowser/quickmarks"))
			    ("qutebrowser/styles/youtube.css" ,(local-file "../../nyxt/youtube.css"))
			    ("qutebrowser/styles/theme.css" ,(local-file "../../nyxt/theme.css"))
			    ("qutebrowser/greasemonkey/yt-ads.js" ,(local-file "../../nyxt/yt-ads.js"))
			    ("qutebrowser/greasemonkey/yt-speed.js" ,(local-file "../../nyxt/yt-speed.js"))))
		 (service home-files-service-type
			  `((".emacs.d/early-init.el" ,(local-file "../../emacs/early-init.el"))
			    (".emacs.d/init.el" ,(local-file "../../emacs/init.el"))
			    (".emacs.d/init-elpaca.el" ,(local-file "../../emacs/init-elpaca.el"))
			    (".emacs.d/init-org.el" ,(local-file "../../emacs/init-org.el"))
			    (".emacs.d/init-pretty.el" ,(local-file "../../emacs/init-pretty.el"))
			    (".emacs.d/init-git.el" ,(local-file "../../emacs/init-git.el"))
			    (".emacs.d/init-completions.el" ,(local-file "../../emacs/init-completions.el"))
			    (".emacs.d/init-prog.el" ,(local-file "../../emacs/init-prog.el"))
			    (".emacs.d/ding.wav" ,(local-file "../../emacs/ding.wav"))
			    (".local/share/nyxt/bookmarks.lisp" ,(local-file "../../nyxt/bookmarks.lisp")))))
           %base-home-services)))
