(require 'org)

(setq org-src-fontify-natively t)
;; [set]agenda-file, Only by agenda-file can be displayed by
;;      agenda-view
(setq org-agenda-files '("~/.emacs.d"))
;; [set]agenda-capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
	("c" "Chrome" entry (file+headline "~/.emacs.d/notes.org" "Quick notes")
	 "* TODO [#C] %?\n  %i\n"
	 :empty-lines 1)))

(provide 'init-org)
