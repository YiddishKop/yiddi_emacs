;; Modify default settings of emacs for better

;; [set]display line number
(global-linum-mode t)
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
;; [set]highlight the other when curson on one paren
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; [set]highlight the both paren when curson in middle
(require 'nadvice)
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
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
;; [set] dired-x makes c-x c-j to open the dired of current editting file
(require 'dired-x)
;; [set] the next-line in win and linux has different encoding-characters
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; [set] improve occur-mode when fit the search results, cursor
;;       will set to the results-window automaticly.
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;;[set] binding same key pattern with occur-dwin, BTW counsel-imenu
;;      used for find all the function-names in this file
(global-set-key (kbd "M-s i") 'counsel-imenu)

(provide 'init-better-defaults)
