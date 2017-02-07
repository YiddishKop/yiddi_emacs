;;;;;;; [melpa] here ;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/init-profile/")
(require 'init-packages)
;; --------------------------
;; [wai]close tool bar
(tool-bar-mode -1)
;; [wai]close scroll bar
(scroll-bar-mode -1)
;; [wai]change cursor type to bar
(setq-default cursor-type 'bar)
;; [wai]load monokai when start-up
(load-theme 'monokai t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;; [set]agenda-file
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [kb]bind a hotkey to open my init.el file
(defun open-my-init-file ()
  (interactive)
  (message "start my file")
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f5>") 'open-my-init-file)
;; [kb-swiper]
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;; [kb] find-function
(global-set-key (kbd "C-h C-f") 'find-function)
;; [kb] find-variable
(global-set-key (kbd "C-h C-v") 'find-variable)
;; [kb] find-function-on-key
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
;; [kb] DIY-auto-indent
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
;; [kb] hippie-expand
(global-set-key (kbd "s-/") 'hippie-expand)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ---------------pkg settings here------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [custom] some custom-settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
