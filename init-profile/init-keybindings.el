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
(global-set-key (kbd "C-c p f") 'counsel-git)
;; (require 'dired) ;; too slow for loading
;; with-eval-after-load will eval (define...) after dired-mode be used
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; [kb] expand-region-mode key-bingdings
(global-set-key (kbd "C-=") 'er/expand-region)
;; [kb] 2 M-s key-bingdings
(global-set-key (kbd "M-s o") 'occur-dwim) ;; improve occur-mode ,when cursor in a word(or selected),use it as search key word
(global-set-key (kbd "M-s i") 'counsel-imenu) ;; find all function-names in a file
(global-set-key (kbd "M-s e") 'iedit-mode) ;; 
;; [kb] 2 org-hotkeys
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
;; [kb] bind company-mode select-up and down from m-n p to C-n p
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
;; [kb] helm-ag , helm-ag
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
(provide 'init-keybindings)
