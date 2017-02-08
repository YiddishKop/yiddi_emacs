;; This setting-file is used to save all the keybinds

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
;; [kb] counsel-git, which used for finding file under git control
(global-set-key (kbd "C-c h f") 'counsel-git)
;; (require 'dired) ;; too slow for loading
;; with-eval-after-load will eval (define...) after dired-mode be used
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(provide 'init-keybindings)
