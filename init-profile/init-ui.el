;; UI-settings

;; [wai]close tool bar
(tool-bar-mode -1)
;; [wai]close scroll bar
(scroll-bar-mode -1)
;; [wai]change cursor type to bar
(setq-default cursor-type 'bar)
;; [wai]load monokai when start-up
(load-theme 'monokai t)

(provide 'init-ui)
