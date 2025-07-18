;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Matthew Kennedy"
      user-mail-address "matthew@matthew-kennedy.com")
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
(load-theme 'catppuccin `relative)
;; (setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato) ; or 'frappe 'latte, 'macchiato, or 'mocha


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Setup custom splashscreen
(defun glory-to-the-omnissiah ()
  (let* ((banner '(
                   "πππππππππππ=÷÷÷ππππππ÷÷××÷≠ππππππ÷÷÷÷÷÷÷÷÷÷×≠πππ"
                   "ππππππππππ×÷÷÷÷÷√ππππ÷÷÷××÷πππππ√÷÷÷≠÷÷÷÷≠×÷≠πππ"
                   "πππππππππππ÷÷÷×÷÷÷÷÷÷÷÷×÷÷×÷÷÷÷××÷×÷×÷≈÷≠÷×÷≠πππ"
                   "ππππππππππππ÷×≠÷÷÷÷÷÷÷÷=÷×÷÷×÷×÷÷÷÷÷÷÷≠×=×××÷πππ"
                   "πππ√÷÷∞πππ∞÷÷÷÷÷÷÷≠≠----+---≈×÷÷÷÷÷÷×÷×××÷×-÷√ππ"
                   "ππ√÷÷÷÷÷÷÷÷×÷÷×≠-----÷÷××÷----÷-×÷÷÷×××××÷÷÷×≈ππ"
                   "πππ×××÷÷≠÷÷÷÷≠-----÷-=÷÷==≠÷××-----÷÷-×÷××∞π÷≠ππ"
                   "πππππ÷÷÷÷÷≠=---×-÷÷÷×÷=≠≠∞∞∞≠=×----÷=×-×-πππππππ"
                   "ππππππ÷÷÷÷÷-----×--=≠÷≠÷÷÷∞≠=≠------÷----πππππππ"
                   "πππππ√÷÷÷÷≠-×-÷=×-÷==×÷÷≈≈≈∞≈≠=------×-×-×ππππππ"
                   "÷÷÷≠-××÷÷÷---÷-÷∞≠≠≈∞≠=≠≠≈≠≈≠≈≠×-----÷×-×--×××÷÷"
                   "÷×÷×=≠≈÷÷×---×--≠=-×-≠-=≠≠-≈÷-÷÷×----÷×--÷÷-×××÷"
                   "××--×××=÷÷----÷≈÷-≈π∞-≠÷÷------≠÷÷≠×-=×-××××-××="
                   "πππππ√÷÷×÷=----×-÷-÷-÷--÷≈××÷÷≈≠≠----÷×-×-ππππππ"
                   "ππππππ××=×÷----×---------÷=-×××-××---×-××√ππππππ"
                   "πππππ×-×××÷----+---÷÷×-×=÷÷---=----÷--××××ππππππ"
                   "πππ≠×÷÷×=×××÷=--------×÷≈≠÷----÷--÷×÷÷-×÷××-≠πππ"
                   "πππ÷×××××××--×÷≈-------÷÷÷÷-×---÷÷××-×××××-×-πππ"
                   "ππππ-×=πππ≈×××÷×××÷---------÷÷××÷××-÷ππππ---ππππ"
                   "ππππππππππππ÷÷=÷×××÷÷÷×==×÷÷×××××÷÷÷ππππππππππππ"
                   "πππππππππππ÷×=×××÷×=-×××××××÷÷×××÷÷÷∞πππππππππππ"
                   "ππππππππππ÷÷××÷×∞πππ√×÷×××÷ππππ×=×-××πππππππππππ"
                   "πππππππππππ÷×××ππππππ×××××∞πππππ√×××√πππππππππππ"
                   ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 50)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'glory-to-the-omnissiah)
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "May the machine spirit be pleased by your work.")))

(assoc-delete-all "Reload last session" +doom-dashboard-menu-sections)

;; set zen as default browser
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "zen")  ; replace with actual executable name

;; Speed of which-key popup
(setq which-key-idle-delay 0.2)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/obsidian-vault/org")

;; source: https://nayak.io/posts/golang-development-doom-emacs/
;; golang formatting set up
;; use gofumpt
(after! lsp-mode
  (setq  lsp-go-use-gofumpt t)
  )
;; automatically organize imports
(add-hook 'go-mode-hook #'lsp-deferred)
;; Make sure you don't have other goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; enable all analyzers; not done by default
(after! lsp-mode
  (setq  lsp-go-analyses '((fieldalignment . t)
                           (nilness . t)
                           (shadow . t)
                           (unusedparams . t)
                           (unusedwrite . t)
                           (useany . t)
                           (unusedvariable . t)))
  )
