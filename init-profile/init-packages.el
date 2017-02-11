;;; package --- summary;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [melpa]The head-line-command which tell emacs to load package from .emacs.d/elpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ---------------pkg settings------------------
;; [pkgs]add whatever pkg you want here
(defvar yiddi/packages '(
			 company       ;; auto-complete
			 monokai-theme ;; sublime-like theme
			 hungry-delete ;; auto-delete many blank space
			 counsel       ;; work with swiper,enhance search and M-x
			 swiper        ;; like up
			 smartparens   ;; auto-complete bracket and quote etc.
			 anaconda-mode ;; for python-mode
			 popwin        ;; auto allocate cursor to help window
			 expand-region ;; a fabulous pkg for selected chars by keyboard
			 iedit         ;; edit a vertical region one time
			 org-pomodoro  ;; a tomato-related time-agenda method
			 helm-ag       ;; good for search *file-content* in project
			 flycheck
			 yasnippet
			 auto-yasnippet
			 evil
			 evil-leader
			 window-numbering
			 powerline
			 ) "Default packages")
(defun yiddi/package-installed-p ()
  (loop for pkg in yiddi/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (yiddi/package-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg yiddi/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; [pkg] company and set it valid for global
(global-company-mode t)
;; [pkg] hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)
;; [pkg] swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;; [pkg] smartparens
(require 'smartparens-config)
;; [pkg] make smartparens global avaiable
(smartparens-global-mode t)
;; [pkg] this will make NOT complete single quote in emacs-lisp
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;; [pkg] anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)

;; [pkg] popwin
(require 'popwin)
(popwin-mode 1)
;; [pkg]  make flycheck-mode active for python-mode
(add-hook 'python-mode-hook 'flycheck-mode)
;; [pkg] yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
;; [pkg] evil
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;; [pkg] evil-leader, from this can we cal some useful fucntion by SPC+e/b/k
;;       Oh-shit! tai bang le !
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bk" 'kill-buffer
  "bb" 'switch-to-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "w/" 'split-window-right
  "w~" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows)

;; [pkg] window-numbering
(window-numbering-mode 1)
;; [pkg] powerline
(require 'powerline)
(powerline-default-theme)

(provide 'init-packages)
