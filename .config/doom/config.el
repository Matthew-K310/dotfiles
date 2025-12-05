;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Matthew Kennedy"
      user-mail-address "matthew@matthew-kennedy.com")

(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo")
      auth-source-cache-expiry nil) ; default is 7200 (2h)

;; allow unlocking of GPG keys in mini-buffer
(setq epg-pinentry-mode 'loopback)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14)
      doom-variable-pitch-font (font-spec :family "Alegreya" :size 18)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 22))
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
;; Check the system type and load themes accordingly
;; (cond
;; ((eq system-type 'darwin)  ;; macOS
;;  (load-theme 'compline t))      ;; Load Compline theme on macOS
;; ((eq system-type 'gnu/linux)  ;; Linux
;;  (load-theme 'ewal-spacemacs-modern t)))  ;; Load pywal theme on Linux
(load-theme 'compline t)
;; (load-theme 'lauds t)
;; (load-theme 'doom-nord t)
;; (load-theme 'catppuccin `relative)
;; (setq catppuccin-flavor 'macchiato)

;; Remove top frame bar in emacs
(add-to-list 'default-frame-alist '(undecorated . t))

;; Emacs statusline
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-lsp-icon t)
(setq doom-modeline-major-mode-color-icon t)

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

;; Relative line numbers
(setq display-line-numbers-type `relative)

;; Better readability while scrolling
(setq scroll-margin 20)

;; Speed of which-key popup
(setq which-key-idle-delay 0.1)

;; Set tab width
(setq-default tab-width 4)

;; Set browser for opening links
(setq browse-url-browser-function 'browse-url-generic)
;; (setq browse-url-generic-program "chromium")
(setq browse-url-generic-program "librewolf")
;; (setq browse-url-generic-program "qutebrowser")

;; Change focus highlight mode
'((prog-mode . defun) (text-mode . paragraph))

(setq tramp-default-method "ssh")

;; prevent eww popups
(remove-hook 'eww-mode-hook #'+popup-buffer-mode)

;; nov.el settings
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(load! "lisp/audio-record")
(load! "lisp/create-daily")
(load! "lisp/done-refile")
(load! "lisp/elfeed-download")
(load! "lisp/jitsi-meeting")
(load! "lisp/meeting-assistant")
(load! "lisp/mu4e-contact")
(load! "lisp/nm")
(load! "lisp/org-find-file-tags")
(load! "lisp/pg-config")
(load! "lisp/pomodoro")
(load! "lisp/popup-dirvish-browser")
(load! "lisp/popup-scratch")
(load! "lisp/post-to-blog")
(load! "lisp/termux-sms")
(load! "lisp/theo")
(load! "lisp/weather")
(load! "private/irc-config")
(load! "private/mu4e-config")

(setq treesit-language-source-alist
      '((javascript "https://github.com/tree-sitter/tree-sitter-javascript")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "typescript/src")
        (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "tsx/src")
        (templ      "https://github.com/templ-go/tree-sitter-templ")
        (html      "https://github.com/tree-sitter/tree-sitter-html")
        (css      "https://github.com/tree-sitter/tree-sitter-css")
        (rust      "https://github.com/tree-sitter/tree-sitter-rust")
        (zig      "https://github.com/tree-sitter/zig-tree-sitter")
        (c      "https://github.com/tree-sitter/tree-sitter-c")
        (csharp      "https://github.com/tree-sitter/tree-sitter-c-sharp")
        (php      "https://github.com/tree-sitter/tree-sitter-php")
        (swift      "https://github.com/tree-sitter/swift-tree-sitter")
        (ruby      "https://github.com/tree-sitter/tree-sitter-ruby")
        (haskell      "https://github.com/tree-sitter/tree-sitter-haskell")
        (go      "https://github.com/tree-sitter/tree-sitter-go")))

(after! tree-sitter
  (require 'tree-sitter-langs)
  (add-to-list 'tree-sitter-major-mode-language-alist '(org-mode . go)))

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

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

;; rust-analyzer integration
(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.3)
  ;; enable / disable the hints as you prefer:
  (lsp-inlay-hint-enable t)
  ;; These are optional configurations. See https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/#lsp-rust-analyzer-display-chaining-hints for a full list
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

;; Custom keymaps
(map! :leader
      ;; elfeed and erc keybinds
      (:prefix ("e" . "elfeed")
       :desc "Open elfeed"         "e" #'elfeed
       :desc "Update elfeed"       "u" #'elfeed-update
       :desc "Open elfeed-tube-mpv" "t" #'elfeed-tube-mpv
       :desc "Open ERC" "r" #'erc
       :desc "Open EWW" "w" #'eww)

      ;; Magit mode mappings
      (:prefix ("g" . "magit")
       :desc "Stage all files"          "a" #'magit-stage-modified
       :desc "goto function definition" "d" #'evil-goto-definition
       :desc "Push"                     "P" #'magit-push
       :desc "Pull"                     "p" #'magit-pull
       :desc "Merge"                    "m" #'magit-merge
       :desc "Quick commit and push"    "z" #'my/magit-stage-commit-push)

      (:prefix ("k" . "kill")
       :desc "Kill process" "p" #'kill-process)
      
      (:prefix ("m" . "music/EMMS")
       :desc "Update from MPD" "u" #'my/update-emms-from-mpd
       :desc "Play at directory tree" "d" #'emms-play-directory-tree
       :desc "Go to emms playlist" "p" #'emms-playlist-mode-go
       :desc "Shuffle" "h" #'emms-shuffle
       :desc "Emms pause track" "x" #'emms-pause
       :desc "Emms stop track" "s" #'emms-stop
       :desc "Emms play previous track" "b" #'emms-previous
       :desc "Emms play next track" "n" #'emms-next
       :desc "EMMS Browser" "o" #'emms-browser)

      ;; notes keybinds
      (:prefix ("n" . "notes")
       :desc "Insert Noter Annotation" "i" #'org-noter-insert-note)

      (:prefix ("b" . "blog")
       :desc "Create new blog post" "n" #'blog/new-post 
       :desc "Export blog post to Hugo MD" "e" #'org-hugo-export-to-md
       :desc "Run Air dev server" "r" #'blog/site-serve
       :desc "Run Hugo dev server" "h" #'blog/hugo-serve)

      (:prefix ("r" . "roam")
       :desc "Find Roam Node"    "f" #'org-roam-node-find
       :desc "Insert Roam Node"  "i" #'org-roam-node-insert
       :desc "Toggle Roam Buffer" "t" #'org-roam-buffer-toggle)
      
      ;; open calendar
      (:prefix ("o" . "open")
       :desc "Calendar" "c" #'=calendar
       :desc "MU4E" "m" #'mu4e)

      ;; Org mode mappings
      (:prefix ("y" . "org-mode-specifics")
       :desc "Export as markdown"        "e" #'org-md-export-as-markdown
       :desc "Preview markdown file"     "p" #'markdown-preview
       :desc "Export as html"            "h" #'org-html-export-as-html
       :desc "Org Roam UI"               "u" #'org-roam-ui-mode
       :desc "Search dictionary at word" "d" #'dictionary-lookup-definition
       :desc "Powerthesaurus lookup"     "t" #'powerthesaurus-lookup-word-at-point
       :desc "Read Aloud This"           "r" #'read-aloud-this
       :desc "Export to PDF"             "l" #'org-pandoc-export-to-latex-pdf
       :desc "Export to PDF & Open"      "L" #'org-pandoc-export-to-latex-pdf-and-open
       :desc "Spell check"               "z" #'ispell-word
       :desc "Find definition"           "f" #'lsp-find-definition)

      ;; Focus/Zen
      (:prefix ("z" . "focus")
       :desc "Toggle zen mode"   "z" #'+zen/toggle
       :desc "Toggle focus mode" "f" #'focus-mode))

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.15) ;; how long to wait until popup
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  :bind
  (:map company-active-map
	("C-n". company-select-next)
	("C-p". company-select-previous)
	("M-<". company-select-first)
	("M->". company-select-last)))

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c p") 'org-capture)
(define-key global-map (kbd "C-c b n") #'blog/new-post)
(define-key global-map (kbd "C-c b h") #'blog/blog-serve-dev) ;; h for hugo
(define-key global-map (kbd "C-c b s") #'blog/site-serve-dev) ;; s for site

;; ;; inbox capture
;; (defun org-capture-inbox ()
;;   (interactive)
;;   (call-interactively 'org-store-link)
;;   (org-capture nil "n"))

;; (define-key global-map (kbd "C-c f") 'org-capture-inbox)

;; random global bind lol
(global-set-key (kbd "C-c n f") #'org-roam-node-find)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c C-x C-a") 'my/archive-done-task)
  (define-key org-mode-map (kbd "C-c n l") #'org-roam-buffer-toggle)
  (define-key org-mode-map (kbd "C-c n i") #'org-roam-node-insert)
  (define-key org-mode-map (kbd "C-c e") #'org-set-effort)
  (define-key org-mode-map (kbd "C-c i") #'org-clock-in)
  (define-key org-mode-map (kbd "C-c o") #'org-clock-out)
  (define-key org-mode-map (kbd "C-c b e") #'org-hugo-export-to-md))

(require 'org)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")
(setq org-agenda-diary-file "~/org/agenda.org")

(after! org
  (map! :map org-mode-map
        :n "<M-left>" #'org-do-promote
        :n "<M-right>" #'org-do-demote))

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "STRT(s)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")))

;; Auto-clock in when state changes to STRT
(defun my/org-clock-in-if-starting ()
  "Clock in when the task state changes to STRT"
  (when (and (string= org-state "STRT")
             (not (org-clock-is-active)))
    (org-clock-in)))

;; Auto-clock out when leaving STRT state
(defun my/org-clock-out-if-not-starting ()
  "Clock out when leaving STRT state"
  (when (and (org-clock-is-active)
             (not (string= org-state "STRT")))
    (org-clock-out)))

;; Add these functions to org-after-todo-state-change-hook
(add-hook 'org-after-todo-state-change-hook 'my/org-clock-in-if-starting)
(add-hook 'org-after-todo-state-change-hook 'my/org-clock-out-if-not-starting)

;; Prevent clock from stopping when marking subtasks as done
(setq org-clock-out-when-done nil)

;; Set archive location to done.org under current date
(defun my/archive-done-task ()
  "Archive current task to done.org under today's date"
  (interactive)
  (let* ((date-header (format-time-string "%Y-%m-%d %A"))
         (archive-file (expand-file-name "~/org/done.org"))
         (location (format "%s::* %s" archive-file date-header)))
    ;; Only archive if not a habit
    (unless (org-is-habit-p)
      ;; Add COMPLETED property if it doesn't exist
      (org-set-property "COMPLETED" (format-time-string "[%Y-%m-%d %a %H:%M]"))
      ;; Set archive location and archive
      (setq org-archive-location location)
      (org-archive-subtree))))

;; refile on done
(defun my/move-to-done-org ()
  "Move the current org heading to done.org under today's date."
  (interactive)
  (let* ((done-file (expand-file-name "~/org/done.org"))
         (today-heading (format-time-string "* %Y-%m-%d %A")))

    ;; First, mark the task as DONE if it's not already
    (when (org-entry-is-todo-p)
      (org-todo 'done))

    ;; Add CLOSED property if it doesn't exist
    (unless (org-entry-get nil "CLOSED")
      (org-add-planning-info 'closed (org-current-effective-time)))

    ;; Ensure done.org exists and has today's date heading
    (with-current-buffer (find-file-noselect done-file)
      (goto-char (point-min))
      ;; Find or create today's heading
      (unless (re-search-forward (concat "^" (regexp-quote today-heading) "$") nil t)
        (goto-char (point-max))
        (unless (bolp) (insert "\n"))
        (insert today-heading "\n")
        (save-buffer)))

    ;; Use org-refile to move the subtree
    (let* ((rfloc (with-current-buffer (find-file-noselect done-file)
                    (goto-char (point-min))
                    (re-search-forward (concat "^" (regexp-quote today-heading) "$"))
                    (list today-heading
                          done-file
                          nil
                          (point)))))
      (org-refile nil nil rfloc))

    (message "Task moved to done.org under %s" today-heading)))

;; Bind to a convenient key
(global-set-key (kbd "C-c d") 'my/move-to-done-org)

(provide 'done-refile)

;; Set this *before* loading org-roam so Doom doesn’t override it.
(setq org-roam-directory (expand-file-name "~/org/roam")
      +org-roam-dir      (expand-file-name "~/org/roam")
      org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory)
      org-roam-database-connector 'sqlite-builtin)

(use-package! org-roam
  :config
  ;; Ensure directory exists
  (unless (file-exists-p org-roam-directory)
    (make-directory org-roam-directory t))

  ;; Extra safety: catch database errors gracefully
  (advice-add 'org-roam-db-query :around
              (lambda (fn &rest args)
                (condition-case err
                    (apply fn args)
                  (error
                   (message "Org-roam DB error: %S" err)
                   nil))))

  ;; Keep DB in sync automatically
  (org-roam-db-autosync-mode +1))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package! org-download
  :after org
  :config
  (setq-default org-download-screenshot-method "scrot -s %s"))

(defun debug-org-roam-db ()
  "Test org-roam DB connection and settings."
  (interactive)
  (message "Org-roam dir: %s (exists: %s)"
           org-roam-directory
           (file-exists-p org-roam-directory))
  (message "DB path: %s" org-roam-db-location)
  (message "Connector: %s" org-roam-database-connector)
  (condition-case err
      (progn
        (org-roam-db-sync)
        (message "Database synced successfully!"))
    (error (message "Database sync error: %S" err))))

;; Keybinds for org mode
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c C-x C-a") 'my/archive-done-task)
  (define-key org-mode-map (kbd "C-c n l") #'org-roam-buffer-toggle)
  (define-key org-mode-map (kbd "C-c n f") #'org-roam-node-find)
  (define-key org-mode-map (kbd "C-c n i") #'org-roam-node-insert)
  (define-key org-mode-map (kbd "C-c e") #'org-set-effort)
  (define-key org-mode-map (kbd "C-c i") #'org-clock-in)
  (define-key org-mode-map (kbd "C-c o") #'org-clock-out))

(defun my/org-checkbox-intermediate ()
  "Set checkbox at point to [-]."
  (interactive)
  (when (org-at-item-checkbox-p)
    (replace-match "-" t t nil 1)))

(map! :map org-mode-map
      :leader
      :desc "Mark checkbox intermediate"
      "m c i" #'my/org-checkbox-intermediate)

(defun my/pandoc-convert-org-to-docx ()
  "Use Pandoc to convert .org to .docx.
Comments:
- The `-N' flag numbers the headers lines.
- Use the `--from org' flag to have this function work on files
  that are in Org syntax but do not have a .org extension"
  (interactive)
  (message "exporting .org to .docx")
  (shell-command
   (concat "pandoc -N --from org " (buffer-file-name)
           " -o "
           (file-name-sans-extension (buffer-file-name))
           (format-time-string "-%Y-%m-%d-%H%M%S") ".docx")))

(setq org-agenda-files
      '("~/org/inbox.org"
        "~/org/todo.org"
        "~/org/habits.org"
        "~/org/projects.org"
        "~/org/agenda.org"
        "~/org/calendar.org"))

(setq org-tag-alist '(("inbox" . ?i)))

(setq org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
         ((agenda ""
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-deadline-warning-days 0)))
          (todo "NEXT"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline))
                 (org-agenda-prefix-format "  %?-12t% s")
                 (org-agenda-overriding-header "\nUp Next\n")))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format "  %?-12t% s")
                      (org-agenda-overriding-header "\nInbox\n")))
          (agenda ""
                  ((org-agenda-overriding-header "\nDeadlines")
                   (org-agenda-entry-types '(:deadline))
                   (org-agenda-format-date "%A, %B %d")
                   (org-deadline-warning-days 7)))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "\nCompleted today\n")))))

        ("w" "Weekly Review"
         ((agenda ""
                  ((org-agenda-span 7)
                   (org-agenda-overriding-header "Calendar (next 7 days)")))
          (tags-todo "inbox"
                     ((org-agenda-overriding-header "Inbox (unprocessed)")))
          (todo "NEXT"
                ((org-agenda-overriding-header "Next Actions")))
          (todo "TODO"
                ((org-agenda-overriding-header "Backlog")
                 (org-agenda-files
                  (cl-remove-if (lambda (f)
                                  (string-match-p "habits\\.org$" f))
                                org-agenda-files))))
          (todo "WAIT"
                ((org-agenda-overriding-header "Blocked / Waiting")))))))

;; Mark tasks with a CLOSED timestamp on DONE
(after! org
  (setq org-log-done 'time)

  ;; Capture templates
  (after! org
    ;; Automatically resume previous task when clocking out
    (setq org-clock-out-resume t)

    (setq org-capture-templates
          '(("t" "Todo" entry
             (file+headline "~/org/inbox.org" "Todo")
             "* TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?" :prepend t)

            ("e" "Event" entry
             (file+headline "~/org/calendar.org" "Events")
             "* %^{Event}\nSCHEDULED: %^T\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")

            ("d" "Deadline" entry
             (file+headline "~/org/calendar.org" "Deadlines")
             "* NEXT %^{Task}\nDEADLINE: %^{Deadline}T\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")

            ("l" "Log / Break" entry
             (file+datetree "~/org/agenda.org")
             "* %?\n%U\n" :clock-in t)

            ("i" "Idea" entry
             (file+headline "~/org/inbox.org" "Ideas")
             "* [%<%Y-%m-%d %a>] %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?" :prepend t)

            ("p" "Project" entry
             (file+headline "~/org/projects.org" "Projects")
             "* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:END:\n** TODO %?")

            ("n" "Note" entry
             (file+headline "~/org/inbox.org" "Inbox")
             "* [%<%Y-%m-%d %a>] %^{Title}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?" :prepend t)

            ("b" "Bookmark" entry
             (file+headline "~/org/bookmarks.org" "Inbox")
             "** [[%^{URL}][%^{Title}]]\n:PROPERTIES:\n:CREATED: %U\n:TAGS: %(org-capture-bookmark-tags)\n:END:\n\n" :empty-lines 0)

            ("c" "Contact" entry
             (file+headline "~/org/contacts.org" "Contacts")
             "* %^{Name}

:PROPERTIES:
:CREATED: %U
:EMAIL: %^{Email}
:PHONE: %^{Phone}
:BIRTHDAY: %^{Birthday +1y}u
:LOCATION: %^{Address}
:END:
\\ *** Notes
%?"))))

  (defun org-capture-bookmark-tags ()
    "Get tags from existing bookmarks and prompt for tags with completion."
    (save-window-excursion
      (let ((tags-list '()))
        ;; Collect existing tags
        (with-current-buffer (find-file-noselect "~/org/bookmarks.org")
          (save-excursion
            (goto-char (point-min))
            (while (re-search-forward "^:TAGS:\\s-*\\(.+\\)$" nil t)
              (let ((tag-string (match-string 1)))
                (dolist (tag (split-string tag-string "[,;]" t "[[:space:]]"))
                  (push (string-trim tag) tags-list))))))
        ;; Remove duplicates and sort
        (setq tags-list (sort (delete-dups tags-list) 'string<))
        ;; Prompt user with completion
        (let ((selected-tags (completing-read-multiple "Tags (comma-separated): " tags-list)))
          ;; Return as a comma-separated string
          (mapconcat 'identity selected-tags ", ")))))

  ;; Helper function to select and link a contact
  (defun org-capture-ref-link (file)
    "Create a link to a contact in contacts.org"
    (let* ((headlines (org-map-entries
                       (lambda ()
                         (cons (org-get-heading t t t t)
                               (org-id-get-create)))
                       t
                       (list file)))
           (contact (completing-read "Contact: "
                                     (mapcar #'car headlines)))
           (id (cdr (assoc contact headlines))))
      (format "[[id:%s][%s]]" id contact))))

(defun blog/new-post (title)
  "Create a new blog post in `~/org/blog/posts/` with TITLE.
Inserts Org front-matter and opens the file."
  (interactive "sPost title: ")
  (let* ((slug (downcase
                (replace-regexp-in-string "[^a-z0-9]+" "-" title)))
         (date (format-time-string "%Y-%m-%d"))
         (filename (format "%s-%s.org" date slug))
         (dir "~/org/blog/")
         (filepath (expand-file-name filename dir)))
    (unless (file-exists-p dir)
      (make-directory dir t))
    (find-file filepath)
    (unless (file-exists-p filepath)
      (insert (format "#+TITLE: %s\n#+DATE: %s\n#+TAGS: \n#+OPTIONS: toc:nil num:nil\n\n"
                      title date))
      (save-buffer))))

(defun thanos/wtype-text (text)
  "Process TEXT for wtype, handling newlines properly."
  (let* ((has-final-newline (string-match-p "\n$" text))
         (lines (split-string text "\n"))
         (last-idx (1- (length lines))))
    (string-join
     (cl-loop for line in lines
              for i from 0
              collect (cond
                       ;; Last line without final newline
                       ((and (= i last-idx) (not has-final-newline))
                        (format "wtype \"%s\""
                                (replace-regexp-in-string "\"" "\\\\\"" line)))
                       ;; Any other line
                       (t
                        (format "wtype \"%s\" && wtype -k Return"
                                (replace-regexp-in-string "\"" "\\\\\"" line)))))
     " && ")))

(define-minor-mode thanos/type-mode
  "Minor mode for inserting text via wtype."
  :keymap `((,(kbd "C-c C-c") . ,(lambda () (interactive)
                                   (call-process-shell-command
                                    (thanos/wtype-text (buffer-string))
                                    nil 0)
                                   (delete-frame)))
            (,(kbd "C-c C-k") . ,(lambda () (interactive)
                                   (kill-buffer (current-buffer))))))

(defun thanos/type ()
  "Launch a temporary frame with a clean buffer for typing."
  (interactive)
  (let ((frame (make-frame '((name . "emacs-float")
                             (fullscreen . 0)
                             (undecorated . t)
                             (width . 70)
                             (height . 20))))
        (buf (get-buffer-create "emacs-float")))
    (select-frame frame)
    (switch-to-buffer buf)
    (with-current-buffer buf
      (erase-buffer)
      (org-mode)
      (flyspell-mode)
      (thanos/type-mode)
      (setq-local header-line-format
                  (format " %s to insert text or %s to cancel."
                          (propertize "C-c C-c" 'face 'help-key-binding)
			  (propertize "C-c C-k" 'face 'help-key-binding)))
      ;; Make the frame more temporary-like
      (set-frame-parameter frame 'delete-before-kill-buffer t)
      (set-window-dedicated-p (selected-window) t))))

(use-package! elfeed
  :commands (elfeed)
  :config
  ;; Where to store the Elfeed database
  (setq elfeed-db-directory (expand-file-name "~/.local/share/elfeed"))
  (make-directory elfeed-db-directory t)

  ;; Update every hour automatically
  (run-at-time nil (* 60 60) #'elfeed-update)

  (use-package! elfeed-org
    :after elfeed
    :config
    (setq rmh-elfeed-org-files
          (list (expand-file-name "~/.config/doom/feeds.org")))
    (elfeed-org)))

(defvar elfeed-download-base-dir (expand-file-name "~/cloud/downloads/elfeed/")
  "Base directory for all Elfeed downloads.")

(defvar elfeed-download-youtube-dir "youtube/"
  "Subdirectory for YouTube videos (relative to base dir).")

(defvar elfeed-download-articles-dir "articles/"
  "Subdirectory for saved articles (relative to base dir).")

(defun elfeed-download--ensure-directory (dir)
  "Ensure directory DIR exists."
  (unless (file-directory-p dir)
    (make-directory dir t)))

(defun elfeed-download--sanitize-filename (filename)
  "Make FILENAME safe for use on the filesystem."
  (replace-regexp-in-string "[^a-zA-Z0-9-_. ]" "_" filename))

(defun elfeed-download--youtube-dir ()
  (expand-file-name elfeed-download-youtube-dir elfeed-download-base-dir))

(defun elfeed-download--articles-dir ()
  (expand-file-name elfeed-download-articles-dir elfeed-download-base-dir))

(defun elfeed-download-youtube (url title)
  "Download a YouTube video at URL with TITLE using yt-dlp."
  (let ((dir (elfeed-download--youtube-dir)))
    (elfeed-download--ensure-directory dir)
    (start-process "yt-dlp" "*yt-dlp*"
                   "yt-dlp"
                   "-o" (concat dir "%(title)s.%(ext)s")
                   url)))

(defun elfeed-download-article (url title)
  "Save article at URL with TITLE as a PDF using Node/Playwright."
  (let* ((dir (elfeed-download--articles-dir))
         (safe-title (elfeed-download--sanitize-filename title))
         (pdf-file (concat dir safe-title ".pdf")))
    (elfeed-download--ensure-directory dir)
    (start-process "playwright-pdf" "*pdf-gen*"
                   "node"
                   elfeed-download-node-script-path
                   url pdf-file)))

(defun elfeed-download-current-entry ()
  "Download the current Elfeed entry (video or article) and mark it read."
  (interactive)
  (let ((entries (elfeed-search-selected)))
    (when entries
      (let* ((entry (if (listp entries) (car entries) entries))
             (url (elfeed-entry-link entry))
             (title (elfeed-entry-title entry)))
        (if (string-match-p "youtube\\.com\\|youtu\\.be" url)
            (elfeed-download-youtube url title)
          (elfeed-download-article url title))
        (elfeed-untag entry 'unread)
        (elfeed-tag entry 'read)
        (elfeed-search-update-entry entry)))))

(defun elfeed-download-setup ()
  "Ensure directories exist and add keybindings for Elfeed downloads."
  (elfeed-download--ensure-directory elfeed-download-base-dir)
  (elfeed-download--ensure-directory (elfeed-download--youtube-dir))
  (elfeed-download--ensure-directory (elfeed-download--articles-dir))
  (when (boundp 'elfeed-search-mode-map)
    (map! :map elfeed-search-mode-map
          :n "d" #'elfeed-download-current-entry))
  (message "Elfeed download integration ready."))

(add-hook 'elfeed-search-mode-hook #'elfeed-download-setup)

(use-package! elfeed-tube
  :after elfeed
  :config
  (elfeed-tube-setup)
  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))

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

(defun my-open-vterm-at-point ()
  "Open vterm in the directory of the currently selected window's buffer.
This function is designed to be called via `emacsclient -e`."
  (interactive)
  (let* ((selected-window (selected-window))
         ;; Ensure selected-window is not nil before trying to get its buffer
         (buffer-in-window (and selected-window (window-buffer selected-window)))
         dir)

    (when buffer-in-window
      (setq dir
            ;; Temporarily switch to the target buffer to evaluate its context
            (with-current-buffer buffer-in-window
              (cond ((buffer-file-name buffer-in-window)
                     (file-name-directory (buffer-file-name buffer-in-window)))
                    ((and (eq major-mode 'dired-mode)
                          (dired-current-directory))
                     (dired-current-directory))
                    (t default-directory)))))

    ;; Fallback to the server's default-directory if no specific directory was found
    (unless dir (setq dir default-directory))

    (message "Opening vterm in directory: %s" dir) ; For debugging, check *Messages* buffer

    ;; Now, crucially, set 'default-directory' for the vterm call itself
    (let ((default-directory dir))
      ;; Call the plain 'vterm' function, which should respect 'default-directory'.
      ;; We are *not* passing 'dir' as an argument to 'vterm' here,
      ;; as it's often designed to pick up the current 'default-directory'.
      (vterm))))
;; Define immediately, not wrapped in after!
(defun my/new-frame-with-vterm ()
  "Create a new frame and immediately open vterm in it."
  (interactive)
  (require 'vterm)
  (let ((new-frame (make-frame '((explicit-vterm . t)))))
    (select-frame new-frame)
    (delete-other-windows)
    ;; Force vterm to take full window
    (let ((vterm-buffer (vterm (format "*vterm-%s*" (frame-parameter new-frame 'name)))))
      (switch-to-buffer vterm-buffer)
      (delete-other-windows))))  ; Nuke any splits vterm created

;; EMMS full configuration with Nord theme, centered layout, and swaync notifications
(use-package! emms
  :defer t
  :commands (emms 
             emms-browser 
             emms-playlist-mode-go
             emms-pause
             emms-stop
             emms-next
             emms-previous
             emms-shuffle)
  :init
  ;; Set these early so they're available when EMMS loads
  (setq emms-source-file-default-directory "~/cloud/music"
        emms-playlist-buffer-name "*Music*"
        emms-info-asynchronously t
        emms-browser-default-browse-type 'artist)
  
  :config
  ;; Initialize EMMS - only runs when you actually use it
  (emms-all)
  (emms-default-players)
  (emms-mode-line-mode 1)
  (emms-playing-time-mode 1)

  ;; Basic settings
  (setq emms-browser-covers #'emms-browser-cache-thumbnail-async
        emms-browser-thumbnail-small-size 64
        emms-browser-thumbnail-medium-size 128
        emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

  ;; MPD integration - critical for your workflow
  (require 'emms-player-mpd)
  (setq emms-player-mpd-server-name "localhost"
        emms-player-mpd-server-port "6600"
        emms-player-mpd-music-directory (expand-file-name "~/cloud/music"))

  ;; Connect to MPD and add it to player list
  (add-to-list 'emms-player-list 'emms-player-mpd)
  (add-to-list 'emms-info-functions 'emms-info-mpd)
  
  ;; Connect to MPD with slight delay to avoid blocking
  (run-with-timer 0.1 nil #'emms-player-mpd-connect)

  ;; Ensure players are properly set up
  (setq emms-player-list '(emms-player-mpd
                           emms-player-mplayer
                           emms-player-vlc
                           emms-player-mpg321
                           emms-player-ogg123))

  ;; Info functions
  (add-to-list 'emms-info-functions 'emms-info-ogginfo)
  (add-to-list 'emms-info-functions 'emms-info-tinytag)

  ;; Nord theme colors
  (custom-set-faces
   ;; Nord
   ;; '(emms-browser-artist-face ((t (:foreground "#ECEFF4" :height 1.1))))
   ;; '(emms-browser-album-face ((t (:foreground "#88C0D0" :height 1.0))))
   ;; '(emms-browser-track-face ((t (:foreground "#A3BE8C" :height 1.0))))
   ;; '(emms-playlist-track-face ((t (:foreground "#D8DEE9" :height 1.0))))
   ;; '(emms-playlist-selected-face ((t (:foreground "#BF616A" :weight bold)))))
   
   ;; Nowhere
   '(emms-browser-artist-face ((t (:foreground "#e0dcd4" :height 1.1))))   ; Parchment - most prominent
   '(emms-browser-album-face ((t (:foreground "#b4bec8" :height 1.0))))    ; Steel-blue - secondary accent
   '(emms-browser-track-face ((t (:foreground "#b4beb4" :height 1.0))))    ; Sage-green - individual tracks
   '(emms-playlist-track-face ((t (:foreground "#c0bdb8" :height 1.0))))   ; Muted foreground - neutral
   '(emms-playlist-selected-face ((t (:foreground "#ccc4b0" :weight bold))))) ; Wheat-gold - warm selection

  ;; Browser keybindings
  (define-key emms-browser-mode-map (kbd "RET") 'emms-browser-add-tracks-and-play)
  ;; (define-key emms-browser-mode-map (kbd "SPC") 'emms-pause)

  ;; Add notification hook
  (add-hook 'emms-player-started-hook 'emms-notify-song-change-with-artwork))

;; Helper functions - defined outside use-package so they're always available
(defun my/update-emms-from-mpd ()
  "Update EMMS cache from MPD and refresh browser."
  (interactive)
  (require 'emms)  ; Ensure EMMS is loaded
  (message "Updating EMMS cache from MPD...")
  (emms-player-mpd-connect)
  (emms-cache-set-from-mpd-all)
  (message "EMMS cache updated. Refreshing browser...")
  (when (get-buffer "*EMMS Browser*")
    (with-current-buffer "*EMMS Browser*"
      (emms-browser-refresh))))

(defun emms-center-buffer-in-frame ()
  "Add margins to center the EMMS buffer in the frame."
  (let* ((window-width (window-width))
         (desired-width 80)
         (margin (max 0 (/ (- window-width desired-width) 2))))
    (setq-local left-margin-width margin)
    (setq-local right-margin-width margin)
    (setq-local line-spacing 0.2)
    (set-window-buffer (selected-window) (current-buffer))))

(defun emms-cover-art-path ()
  "Return the path of the cover art for the current track."
  (when (bound-and-true-p emms-playlist-buffer)
    (let* ((track (emms-playlist-current-selected-track))
           (path (emms-track-get track 'name))
           (dir (file-name-directory path))
           (standard-files '("cover.jpg" "cover.png" "folder.jpg" "folder.png"
                             "album.jpg" "album.png" "front.jpg" "front.png"))
           (standard-cover (cl-find-if
                            (lambda (file)
                              (file-exists-p (expand-file-name file dir)))
                            standard-files)))
      (if standard-cover
          (expand-file-name standard-cover dir)
        (let ((cover-files (directory-files dir nil ".*\\(jpg\\|png\\|jpeg\\)$")))
          (when cover-files
            (expand-file-name (car cover-files) dir)))))))

(defun emms-notify-song-change-with-artwork ()
  "Send song change notification with album artwork to swaync via libnotify."
  (when (bound-and-true-p emms-playlist-buffer)
    (let* ((track (emms-playlist-current-selected-track))
           (artist (or (emms-track-get track 'info-artist) "Unknown Artist"))
           (title (or (emms-track-get track 'info-title) "Unknown Title"))
           (album (or (emms-track-get track 'info-album) "Unknown Album"))
           (cover-image (emms-cover-art-path)))
      
      (apply #'start-process
             "emms-notify" nil "notify-send"
             "-a" "EMMS"
             "-c" "music"
             (append
              (when cover-image
                (list "-i" cover-image))
              (list
               (format "Now Playing: %s" title)
               (format "Artist: %s\nAlbum: %s" artist album)))))))

(defun emms-signal-waybar-mpd-update ()
  "Signal waybar to update its MPD widget."
  (start-process "emms-signal-waybar" nil "pkill" "-RTMIN+8" "waybar"))

;; Hooks for EMMS modes - use with-eval-after-load to avoid premature loading
(with-eval-after-load 'emms-browser
  (add-hook 'emms-browser-mode-hook
            (lambda ()
              (face-remap-add-relative 'default '(:background "#1a1d21"))
              (emms-center-buffer-in-frame))))

(with-eval-after-load 'emms-playlist-mode
  (add-hook 'emms-playlist-mode-hook
            (lambda ()
              (face-remap-add-relative 'default '(:background "#1a1d21"))
              (emms-center-buffer-in-frame))))

;; Window resize hook - only add when EMMS is actually loaded
(with-eval-after-load 'emms
  (add-hook 'window-size-change-functions
            (lambda (_)
              (when (or (eq major-mode 'emms-browser-mode)
                        (eq major-mode 'emms-playlist-mode))
                (emms-center-buffer-in-frame)))))

(defvar site-serve-process nil)
(defvar blog-serve-process nil)

(defun my/run-dev-server (dir command &optional process-name output-buffer)
  "Run a development server in the specified directory with the given command.
DIR is the directory where the process will be run.
COMMAND is the command to execute (e.g., 'just serve').
PROCESS-NAME is an optional name for the process.
OUTPUT-BUFFER is the buffer to capture the output."
  (interactive "DDirectory: \nsCommand: ")
  (let ((default-directory dir)
        (process-name (or process-name (concat "just-" command)))
        (output-buffer (or output-buffer (concat "*" command "-output*"))))
    (setq site-serve-process
          (start-process process-name output-buffer "just" command))))

(defun blog/site-serve-dev ()
  "Run the site dev server locally."
  (interactive)
  (my/run-dev-server "/home/matthewkennedy/site/" "serve" "site-serve" "*site-serve-output*"))

(defun blog/blog-serve-dev ()
  "Run the blog dev server locally."
  (interactive)
  (my/run-dev-server "/home/matthewkennedy/site/hugo/" "test" "blog-serve" "blog-serve-output"))
