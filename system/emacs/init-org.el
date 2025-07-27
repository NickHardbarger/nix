(use-package org
  :ensure nil
  :config
  (add-to-list 'org-agenda-files "~/notes/agenda.org")
  (setq org-clock-sound "~/.emacs.d/ding.wav") ; https://freesound.org/people/.Andre_Onate/sounds/484665/
  
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.1))))))
