;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Theme
(package! catppuccin-theme)
(package! nord-theme)
(package! ewal-spacemacs-themes)

;; Dev tools
(package! forge)
(package! ghub)

;; go dev
(package! templ-ts-mode)
(package! go-mode)

;; essential org
(package! org-roam)
(package! org-roam-bibtex)
(package! ox-hugo)

;; org mode
(package! org-caldav)

;; writing tools
(package! org-roam-ui)
(package! org-bullets)
(package! focus)
(package! citar-org-roam)

;; Communication
(package! jabber)

;; file navigation
(package! dirvish)
(package! harpoon)

;; elfeed utilities
(package! elfeed-tube)
(package! elfeed-tube-mpv)

;; Other tools
(package! syncthing)
(package! inhibit-mouse)
(package! emacs-w3m)

(package! ledger-mode)
(package! evil-ledger)
