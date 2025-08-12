;; GENERAL
(define-configuration buffer
    ((default-modes
	 (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))

(define-configuration web-buffer
    ((default-modes
	 (append '(nyxt/mode/blocker:blocker-mode
		   nyxt/mode/reduce-tracking:reduce-tracking-mode
		   nyxt/mode/user-script:user-script-mode)
		 %slot-value%))))

;; THEME
(define-configuration browser
    ((theme
      (make-instance 'theme:theme :background-color "#eee8d5"
                     :action-color "#268bd2" :primary-color "#073642"
                   :secondary-color "#586e75" :success-color
                   "#2aa198" :warning-color "#dc322f"
                   :highlight-color "#d33682" :codeblock-color
                   "#6c71c4" :text-color "#002b36"
                   :contrast-text-color "#fdf6e3")
      :doc
      "Covers all the semantic groups (warning-color, codeblock-color etc.)
Note that you can also define more nuanced colors, like warning-color+, so
that the interface gets even nicer. Otherwise Nyxt generates the missing colors
automatically, which should be good enough... for most cases.")))

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
