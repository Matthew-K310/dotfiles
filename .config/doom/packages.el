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
;; (package! forge)
(package! ghub)

;; go dev
(package! templ-ts-mode)
(package! go-mode)

;; org modules
(package! org-roam)
(package! org-roam-ui)
;; (package! org-roam-bibtex)
(package! org-bullets)
(package! ox-hugo)
(package! org-noter)
(package! org-noter-pdftools)

;; org mode
(package! org-caldav)

;; writing tools
(package! focus)
;; (package! citar-org-roam)

;; Communication
(package! jabber)

;; file navigation
(package! dirvish)
(package! harpoon)

;; elfeed
(package! elfeed-tube)
(package! elfeed-tube-mpv)

;; Other tools
(package! syncthing)
(package! inhibit-mouse)
(package! emacs-w3m)

;; accounting
(package! ledger-mode)
(package! evil-ledger)
