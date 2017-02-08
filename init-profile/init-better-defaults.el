;; Modify default settings of emacs for better

;; [set]display line number
(linum-mode 1)
;; [set]close start-up
(setq inhibit-splash-screen t)
;; [set]open recentf-mode
(recentf-mode t)
;; [set]close back-up-file
(setq make-backup-files nil)
;; [set]open recentf-mode and binding hotkey c-x c-r
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; [set]choosed to delete
(delete-selection-mode t)
;; [set]hignlight cursor line
(global-hl-line-mode t)
;; [set]start-up full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; [set]auto revert
(global-auto-revert-mode t)
;; [set]stop backup automaticly
(setq make-backup-files nil)
(setq auto-save-default nil)
;; [set]DIY abbreviation
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8yd" "YiddishKop")
					    ;; emacs regex
					    ("8ms" "MicroSoft")
					    ))
;; [set]DIY indent automaticly without selected-region
(defun indent-buffer ()
  "indent the currently visited buffer"
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer ()
  "indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "indent selected region."))
      (progn
	(indent-buffer)
	(message "indented buffer.")))))
;; [set]hippie-expand
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name
					 try-complete-file-name-partially
					 try-complete-lisp-symbol
					 try-complete-lisp-symbol-partially
					 try-expand-all-abbrevs
					 try-expand-line
					 try-expand-line))

;; [set] yes-or-no -> y-or-n
(fset 'yes-or-no-p 'y-or-n-p)
;; [set] DIRED SETTINGS
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)
;; every time we open dired-mode will create a new buffer.
;; this function will hold only one dired buffer all the times
(put 'dired-find-alternate-file 'disabled nil)
;; [set] dwim-target, copy file between 2 dired buffer
(setq dired-dwim-target t)

(require 'dired-x)

(provide 'init-better-defaults)
