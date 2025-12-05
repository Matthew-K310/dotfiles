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

;; go dev
(package! templ-ts-mode)
(package! go-mode)

;; org
(package! org-roam)
(package! org-roam-ui)
(package! org-bullets)
(package! ox-hugo)
(package! org-noter)
(package! org-noter-pdftools)
(package! org-caldav)
(package! org-habit-stats)

;; utils
(package! nov)
(package! djvu)
;; accounting
(package! evil-ledger)
(package! ledger-mode)
(package! inhibit-mouse)
(package! elfeed-tube)
(package! elfeed-tube-mpv)
(package! focus)
(package! forge)

;; programs
(package! bluetooth)
(package! elfeed)
(package! dirvish)
(package! pipewire)
(package! harpoon)
(package! syncthing)
(package! emacs-w3m)
(package! jabber)
