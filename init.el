;; All the settings are sort into 5 files.
;; [!!!]init-packages should always be the first

(add-to-list 'load-path "~/.emacs.d/init-profile/")

(require 'init-packages)
(require 'init-keybindings)
(require 'init-better-defaults)
(require 'init-ui)
(require 'custom)



