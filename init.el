;; All the settings are sort into 5 files.
;; [!!!]init-packages should always be the first


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/init-profile/")

(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "init-profile/custom.el" user-emacs-directory))
(load-file custom-file)


