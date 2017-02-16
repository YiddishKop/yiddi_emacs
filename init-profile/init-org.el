(require 'org)

(setq org-src-fontify-natively t)
;; [set]agenda-file, Only by agenda-file can be displayed by
;;      agenda-view
(setq org-agenda-files '("~/.emacs.d"))
(setq org-directory '("~/Documents/org-notes")) ;; 后期为了配置文件的健壮性,应把目录都设置为 concat org-directory
;; [set]agenda-capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)
	("c" "Notes" entry (file+headline "~/Documents/org-notes/notes.org" "Quick notes")
	 "* TODO [#C] %?\n  %i\n"
	 :empty-lines 1)
	;;; [copy from org-capture-extension] for chrome in github
	;;; modify the name notes.org to notes-chrome.org,both two items below
	("p" "Protocol" entry (file+headline "~/Documents/org-notes/notes-chrome.org" "Chome Inbox")
	 "* %c\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?"
	 :immediate-finish)
	("L" "Protocol Link" entry (file+headline "~/Documents/org-notes/notes-chrome.org" "Chome Inbox")
	 "* %? [[%:link][%:description]] \nCaptured On: %U" 
	 )
	("i" "Image-emacs" entry (file+headline "~/Documents/org-notes/Img-emacs.org" "Image-emacs")
	 "* TODO [#C] %?\n  %i\n"
	 :empty-lines 1)
	))
;;;;;;;;;;;;;;;;  [copy from org-capture-extension] used for org-chrome-capture
;; Kill the frame if one was created for the capture
(defvar kk/delete-frame-after-capture 0 "Whether to delete the last frame after the current capture")

(defun kk/delete-frame-if-neccessary (&rest r)
  (cond
   ((= kk/delete-frame-after-capture 0) nil)
   ((> kk/delete-frame-after-capture 1)
    (setq kk/delete-frame-after-capture (- kk/delete-frame-after-capture 1)))
   (t
    (setq kk/delete-frame-after-capture 0)
    (delete-frame))))

(advice-add 'org-capture-finalize :after 'kk/delete-frame-if-neccessary)
(advice-add 'org-capture-kill :after 'kk/delete-frame-if-neccessary)
(advice-add 'org-capture-refile :after 'kk/delete-frame-if-neccessary)

(provide 'init-org)
