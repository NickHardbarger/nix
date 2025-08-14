;;; Gruvbox
(defvar bg0-hard "#1d2021")
(defvar bg0-soft "#32302f")
(defvar bg0 "#282828")
(defvar bg1 "#3c3836")
(defvar bg2 "#504945")
(defvar bg3 "#665c54")
(defvar bg4 "#7c6f64")
(defvar fg0 "#fbf1c7")
(defvar fg1 "#ebdbb2")
(defvar fg2 "#d5c4a1")
(defvar fg3 "#bdae93")
(defvar fg4 "#a89984")
(defvar bright-red "#fb4934")
(defvar bright-green "#b8bb26")
(defvar bright-yellow "#fabd2f")
(defvar bright-blue "#83a598")
(defvar bright-purple "#d3869b")
(defvar bright-aqua "#8ec07c")
(defvar bright-gray "#928374")
(defvar bright-orange "#fe8019")
(defvar dark-red "#cc241d")
(defvar dark-green "#98971a")
(defvar dark-yellow "#d79921")
(defvar dark-blue "#458588")
(defvar dark-purple "#b16286")
(defvar dark-aqua "#689d6a")
(defvar dark-gray "#a89984")
(defvar dark-orange "#d65d0e")

(defvar gruvbox-theme
  (make-instance 'theme:theme
		 :dark-p t
		 :background-color- bg0-soft
		 :background-color bg0 ; black
		 :background-color+ bg0-hard
		 :on-background-color "white"
		 
		 :primary-color bright-blue ; light blue
		 :on-primary-color "black"
		 
		 :secondary-color dark-gray ; gray
		 :on-secondary-color "white"
		 
		 :action-color dark-green; dark green
		 :on-action-color "black"
		 
		 :success-color bright-green; light green
		 :on-success-color "black"
		 
		 :highlight-color bright-purple; pink
		 :on-highlight-color "black"
		 
		 :warning-color dark-yellow ; yellow
		 :on-warning-color "black"
		 
		 :codeblock-color dark-blue ; dark blue
		 :on-codeblock-color "white"))

;;; Invader
(defvar invader-theme
  (make-instance 'theme:theme
                 :dark-p t
                 :background-color- "#303240"
                 :background-color "#282A36"
                 :background-color+ "#1E2029"
                 :on-background-color "#F7FBFC"

                 :primary-color- "#679BCF"
                 :primary-color "#789FE8"
                 :primary-color+ "#7FABD7"
                 :on-primary-color "#0C0C0D"

                 :secondary-color- "#44475A"
                 :secondary-color "#44475A"
                 :secondary-color+ "#535A6E"
                 :on-secondary-color "#F7FBFC"

                 :action-color- "#6BE194"
                 :action-color "#4FDB71"
                 :action-color+ "#27BF4C"
                 :on-action-color "#0C0C0D"

                 :success-color- "#86D58E"
                 :success-color "#8AEA92"
                 :success-color+ "#71FE7D"
                 :on-success-color "#0C0C0D"

                 :highlight-color- "#EA43DD"
                 :highlight-color "#F45DE8"
                 :highlight-color+ "#FC83F2"
                 :on-highlight-color "#0C0C0D"

                 :warning-color- "#FCA904"
                 :warning-color "#FCBA04"
                 :warning-color+ "#FFD152"
                 :on-warning-color "#0C0C0D"

                 :codeblock-color- "#3C5FAA"
                 :codeblock-color "#355496"
                 :codeblock-color+ "#2D4880"
                 :on-codeblock-color "#F7FBFC"))

(define-configuration browser
    ((theme gruvbox-theme)))
