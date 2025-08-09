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

;; GREASEMONKEY
;; (define-configuration nyxt/mode/user-script:user-script-mode
;;   ((nyxt/mode/user-script:user-scripts
;;     (list
;;      (make-instance 'nyxt/mode/user-script:user-script :code
;;                     "// ==UserScript==
;;                               // @name          No navbars!
;;                               // @description	A simple script to remove navbars
;;                               // @run-at        document-end
;;                               // @include       http://*/*
;;                               // @include       https://*/*
;;                               // @noframes
;;                               // ==/UserScript==

;;                               var elem = document.querySelector(\"header\") || document.querySelector(\"nav\");
;;                               if (elem) {
;;                               elem.parentNode.removeChild(elem);
;;                               }"))
;;     :doc "Alternatively, save the code to some file and use
;; :base-path #p\"/path/to/our/file.user.js\".
;; Or fetch a remote script with
;; url (quri:uri \"https://example.com/script.user.js\")")))

;; SEARCH ENGINES
(defvar *my-search-engines*
  (list
   '("python3" "https://docs.python.org/3/search.html?q=~a"
     "https://docs.python.org/3")
   '("doi" "https://dx.doi.org/~a" "https://dx.doi.org/")
   '("google" "https://google.com/search?q=~a" "https://google.com"))
  "List of search engines.")

(define-configuration context-buffer
    "Go through the search engines above and make-search-engine out of them."
  ((search-engines
    (append
     (mapcar (lambda (engine) (apply 'make-search-engine engine))
             *my-search-engines*)
     %slot-default%))))
