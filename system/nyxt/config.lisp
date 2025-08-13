(in-package #:nyxt-user)

(nyxt::load-lisp "~/.config/nyxt/theme.lisp")

;; GENERAL
(define-configuration buffer
    ((default-modes
	 (append '(nyxt/mode/emacs:emacs-mode
		   dark-mode)
		 %slot-value%))))

(define-configuration web-buffer
    ((default-modes
	 (append '(nyxt/mode/blocker:blocker-mode
		   nyxt/mode/reduce-tracking:reduce-tracking-mode
		   nyxt/mode/user-script:user-script-mode)
		 %slot-value%))))

;; USER SCRIPTS
(define-configuration nyxt/mode/user-script:user-script-mode
  ((nyxt/mode/user-script:user-scripts
    (list
     ;; Triggers YouTube's adblock blocker
     ;; (make-instance 'nyxt/mode/user-script:user-script :base-path #p"~/nix/system/nyxt/yt-ads.js")
     (make-instance 'nyxt/mode/user-script:user-script :base-path #p"~/nix/system/nyxt/yt-speed.js"))
    :doc "Save the code to some file and use :base-path #p\"/path/to/our/file.user.js\".")))

(nyxt/mode/bookmarklets:define-bookmarklet-command-global set-playback-speed
    "Easily tweak video playback speed. Website agnostic."
  "(function() {
  const rate = prompt('Set new playback speed', 1.5);
  if (rate != null) {
  // Not sure which of these is better
  const video = document.getElementsByTagName('video')[0]; // .getElementsByClassName('html5-main-video')[0];
  video.playbackRate = parseFloat(rate);
  }})();")

;; SEARCH ENGINES
(define-configuration browser
    ((default-new-buffer-url (quri:uri "https://duckduckgo.com/?q="))))

(defvar *my-search-engines*
  (list
   '("google" "https://google.com/search?q=~a" "https://google.com")
   '("ddg" "https://duckduckgo.com/?q=" "https://duckduckgo.com"))
  "List of search engines.")

(define-configuration context-buffer
    "Go through the search engines above and make-search-engine out of them."
  ((search-engines
    (append
     (mapcar (lambda (engine) (apply 'make-search-engine engine))
             *my-search-engines*)
     %slot-default%))))
