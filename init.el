;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [melpa]The head-line-command which tell emacs
;;      to load package from .emacs.d/elpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ---------------pkg settings------------------
;; [pkgs]add whatever pkg you want here
(defvar yiddi/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 counsel
			 swiper
			 smartparens
			 anaconda-mode
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
;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;; [pkg] anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)

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
