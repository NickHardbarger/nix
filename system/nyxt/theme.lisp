(define-configuration browser
    ((theme (make-instance 'theme:theme
			   :font-family "Public Sans"
			   :monospace-font-family "JetBrainsMonoNF"
			   :background-color "#282828"
			   :action-color "#b16286"
			   :primary-color "#cc241d"
			   :secondary-color "#98971a"
			   :text-color "#689d6a"
			   :contrast-text-color "#1d2021"))))

(define-configuration nyxt/style-mode:dark-mode
    ((style #.(cl-css:css
	       '((*
		  :background-color "#282828 !important"
		  :background-image "none !important"
		  :color "#ebdbb2")
		 (a
		  :background-color "#282828 !important"
		  :background-image "none !important"
		  :color "#458588 !important"))))))
