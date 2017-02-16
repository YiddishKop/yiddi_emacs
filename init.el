;; All the settings are sort into 5 files.
;; [!!!]init-packages should always be the first


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;;----- supported by cask and pllet--------
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
;;----- supported by cask and pllet--------

(add-to-list 'load-path "~/.emacs.d/init-profile/")

(add-to-list 'load-path "/usr/local/share/emacs/25.1/lisp/org") ;; add to support org-protocol
(server-start) ;; add to support org-protocol
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-org)
(require 'org-protocol)    ;; add to support org-protocol
(require 'init-keybindings)
(setq custom-file (expand-file-name "init-profile/custom.el" user-emacs-directory))

;; 据说可以加快emacs的启动速度,出现在rock-spacemacs-day10
(setq tramp-ssh-controlmaster-options
      "-o Controlmaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(load-file custom-file)



