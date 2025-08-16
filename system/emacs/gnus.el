(setq gnus-select-method '(nntp "news.gwene.org"))

;; Doesn't seem to work
(defvar my-gnus-rss-tech-list
  '("nntp+news.gwene.org:gmane.emacs.announce"
    "nntp+news.gwene.org:gwene.com.reddit.r.linux"
    "nntp+news.gwene.org:gwene.com.reddit.r.nixos"))
(add-to-list 'gnus-topic-alist (add-to-list 'my-gnus-rss-tech-list "Tech") t)
