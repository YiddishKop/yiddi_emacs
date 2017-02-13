;;; package --- summary;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cl)
;; [melpa]The head-line-command which tell emacs to load package from .emacs.d/elpa
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (setq package-archives '(
;; 	("melpa" . "http://elpa.zilongshanren.com/melpa/")
;;   )))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ---------------pkg settings------------------
;; ;; [pkgs]add whatever pkg you want here
;; (defvar yiddi/packages '(
;; 			 company       ;; auto-complete
;; 			 monokai-theme ;; sublime-like theme
;; 			 hungry-delete ;; auto-delete many blank space
;; 			 counsel       ;; work with swiper,enhance search and M-x
;; 			 swiper        ;; like up
;; ;;			 smartparens   ;; auto-complete bracket and quote etc.
;; 			 anaconda-mode ;; for python-mode
;; 			 popwin        ;; auto allocate cursor to help window
;; 			 expand-region ;; a fabulous pkg for selected chars by keyboard
;; 			 iedit         ;; edit all occurances of certain content one time
;; 			 ;; it seems like cua-mode, which can edit certain
;; 			 ;; region vertically one time
;; 			 org-pomodoro  ;; a tomato-related time-agenda method
;; 			 helm-ag       ;; good for search *file-content* in project
;; 			 flycheck
;; 			 yasnippet
;; 			 auto-yasnippet
;; 			 evil
;; 			 evil-leader
;; 			 window-numbering
;; 			 evil-surround
;; 			 evil-nerd-commenter
;; 			 which-key     ;; work with leader-key, wow~,
;; 			 ;;you dont need to remember soooo many hotkeys
;; 			 mwe-log-commands
;; 			 ) "Default packages")
;; (defun yiddi/package-installed-p ()
;;   (loop for pkg in yiddi/packages
;; 	when (not (package-installed-p pkg)) do (return nil)
;; 	finally (return t)))
;; (unless (yiddi/package-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg yiddi/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))

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
  "wm" 'delete-other-windows
  "qq" 'save-buffers-kill-terminal)

;; [pkgs] make some some mode can move cursor like evil-mode
(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/")   'evil-search-forward
	      (kbd "n")   'evil-search-next
	      (kbd "N")   'evil-search-previous
	      (kbd "C-d") 'evil-scroll-down
	      (kbd "C-u") 'evil-scroll-up)
	    ))

;; comment-out becaus new-version evil-mode is good enough to sovle these problems below
;; [pkgs] evil-mode , modify default evil-state when encounter certain modes
;;        * this code block show me how to activate specific evil-state
;;        * under some modes you want 
;; (dolist (mode ('ag-mode
;; 	           flycheck-error-list-mode
;; 	           git-rebase-mode))
;;   (add-to-list 'evil-emacs-state-modes mode))


;; [pkg] window-numbering
(window-numbering-mode 1)
;; [pkg] evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;;[pkg] evil-nerd-commenter
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
;; [pkgs] which-key mode
(which-key-mode 1)

;; chinese-pyim
(use-package chinese-pyim
  :ensure nil
  :config
  ;; 激活 basedict 拼音词库
  (use-package chinese-pyim-basedict
    :ensure nil
    :config (chinese-pyim-basedict-enable))

  (setq default-input-method "chinese-pyim")

  ;; 我使用全拼
  (setq pyim-default-scheme 'quanpin)

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  (setq pyim-isearch-enable-pinyin-search t)

  ;; 使用 pupup-el 来绘制选词框
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示5个候选词
  (setq pyim-page-length 5)

  ;; 让 Emacs 启动时自动加载 pyim 词库
  (add-hook 'emacs-startup-hook
            #'(lambda () (pyim-restart-1 t)))
  :bind
  (("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(setq default-input-method "chinese-pyim")


(provide 'init-packages)
