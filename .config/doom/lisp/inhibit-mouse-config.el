(use-package inhibit-mouse
  :custom
  ;; Disable highlighting of clickable text such as URLs and hyperlinks when hovered.
  (inhibit-mouse-adjust-mouse-highlight t)

  ;; Disable tooltips (show-help-function) during mouse events.
  (inhibit-mouse-adjust-show-help-function t)

  :config
  ;; Enable in both daemon and normal sessions
  (add-hook 'after-init-hook #'inhibit-mouse-mode)
  (add-hook 'server-after-make-frame-hook #'inhibit-mouse-mode))

(provide 'inhibit-mouse-config)
