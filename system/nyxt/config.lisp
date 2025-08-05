(define-configuration buffer
    ((default-modes
	 (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))

(define-configuration web-buffer
    ((default-modes
	 (append '(nyxt/mode/blocker:blocker-mode
		   nyxt/mode/reduce-tracking:reduce-tracking-mode)
		 %slot-value%))))
