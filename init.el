;; All the settings are sort into 5 files.
;; [!!!]init-packages should always be the first


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; !!! 半成品,仅供参考

;; [TOOD-list]
;;    - 1. 光标在中间,两边括号不高亮;
;;    - 2. anaconda-mode 启用失败,一直server-error

;; [Before run-emacs]
;;    - 需要安装cask,而后通过cask install进行初始安装.
;;    - 想继续使用ananoda-mode,需要先安装python-pip,然后通过pip install 安装jedi,安装anaconda-mode


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



