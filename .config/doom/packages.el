;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Theme
;; (package! catppuccin-theme)
(package! nord-theme)
(package! ewal-spacemacs-themes)

;; go dev
(package! templ-ts-mode)
(package! go-mode)

;; org mode
(package! org-roam)
(package! org-roam-ui)
(package! org-roam-bibtex)
(package! org-bullets)
(package! org-caldav)
;; (package! denote)

;; writing tools
(package! focus)

;; file navigation
(package! dirvish)
(package! harpoon)

;; elfeed utilities
(package! elfeed-tube)
(package! elfeed-tube-mpv)

;; Other tools
(package! syncthing)
