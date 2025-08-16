;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Matthew Kennedy"
      user-mail-address "matthew@matthew-kennedy.com")
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the

(setq doom-font (font-spec :family "JetBrains Mono NL" :size 16)
      doom-big-font (font-spec :family "JetBrains Mono NL" :size 22))

;; `load-theme' function. This is the default:
(add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
(load-theme 'doom-nord t)
;; (load-theme 'catppuccin `relative)
;; (setq catppuccin-flavor 'macchiato)

(setq auth-sources
      '((:source "~/.config/doom/private/.authinfo")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "qutebrowser")

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
(assoc-delete-all "Jump to bookmark" +doom-dashboard-menu-sections)
(assoc-delete-all "Open documentation" +doom-dashboard-menu-sections)

;; Speed of which-key popup
(setq which-key-idle-delay 0.2)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/org")
(setq diary-file "~/Notes/org/agenda.org")
(add-to-list 'org-agenda-files "~/Notes/org/agenda.org")


(after! org
  (map! :map org-mode-map
        :n "<M-left>" #'org-do-promote
        :n "<M-right>" #'org-do-demote)
  )

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

;; Capture templates
(after! org
  (setq org-capture-templates
        '(("t" "Todo" entry
           (file+headline "~/Notes/org/inbox.org" "Inbox")
           "* TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("e" "Event" entry
           (file+headline "~/Notes/org/agenda.org" "Events")
           "* %^{Event}\n%^{SCHEDULED}T\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("d" "Deadline" entry
           (file+headline "~/Notes/org/agenda.org" "Deadlines")
           "* TODO %^{Task}\nDEADLINE: %^{Deadline}T\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("p" "Project" entry
           (file+headline "~/Notes/org/projects.org" "Projects")
           "* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n** TODO %?")

          ("i" "Idea" entry
           (file+headline "~/Notes/org/ideas.org" "Ideas")
           "** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("c" "Contact" entry
           (file+headline "~/org/contacts.org" "Inbox")
           "* %^{Name}

:PROPERTIES:
:CREATED: %U
:EMAIL: %^{Email}
:PHONE: %^{Phone}
:BIRTHDAY: %^{Birthday +1y}u
:LOCATION: %^{Address}
:END:
\\ *** Notes
%?")

          ("n" "Note" entry
           (file+headline "~/Notes/org/notes.org" "Inbox")
           "* [%<%Y-%m-%d %a>] %^{Title}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?"
           :prepend t))))

;; weekly journal
(defun create-weekly-journal-file ()
  "Create a weekly journal file for review and habit tracking."
  (interactive)

  (let* ((current-time (current-time))
         ;; Get the year (like 2025)
         (year (format-time-string "%Y" current-time))

         ;; Get ISO week number (01–53, starts on Monday)
         (week-number (string-to-number (format-time-string "%V" current-time)))

         ;; Filename like "Week 33, 2025"
         (date-string (format "Week %02d, %s" week-number year))

         ;; Folder paths
         (year-dir (expand-file-name year "~/Notes/org/journal/"))
         (week-dir (expand-file-name (format "Week %d" week-number) year-dir))

         ;; Full file path
         (file-path (expand-file-name (concat date-string ".org") week-dir)))

    ;; Ensure folders exist
    (unless (file-exists-p year-dir)
      (make-directory year-dir t))
    (unless (file-exists-p week-dir)
      (make-directory week-dir t))

    ;; Open or create the file
    (find-file file-path)

    ;; Insert template if file is empty
    (when (= (buffer-size) 0)
      (yas-expand-snippet
       (with-temp-buffer
         (insert-file-contents "~/.config/doom/snippets/weekly")
         (buffer-string))))))

;; daily journal
(defun create-daily-file ()
  "Create a daily journal file organized by year and week number."
  (interactive)

  (let* ((current-time (current-time))
         (decoded-time (decode-time current-time))

         ;; Get the year (like 2025)
         (year (format-time-string "%Y" current-time))

         ;; Get week number (1-53) - using %V instead of %U
         ;; %V gives ISO week number where weeks start on Monday
         ;; This should correctly identify March 24, 2025 as week 13
         (week-number (string-to-number (format-time-string "%V" current-time)))

         ;; Get friendly date format like "March 24, 2025"
         (format-time-string "%A, %B %d, %Y" current-time)

         ;; Create folder paths
         (year-dir (expand-file-name year "~/Notes/org/journal/"))
         (week-dir (expand-file-name (format "Week %d" week-number) year-dir))

         ;; Create file path/name
         (file-path (expand-file-name (concat date-string ".org") week-dir)))

    ;; Step 2: Make sure folders exist
    (unless (file-exists-p year-dir)
      (make-directory year-dir t))

    (unless (file-exists-p week-dir)
      (make-directory week-dir t))

    ;; Step 3: Create the file (or open it if it exists)
    (find-file file-path)

    ;; Step 4: Insert template if file is empty
    (when (= (buffer-size) 0)
      (yas-expand-snippet
       (with-temp-buffer
         (insert-file-contents "~/.config/doom/snippets/daily")
         (buffer-string))))))

;; tomorrow's daily journal
(defun create-tomorrows-daily-file ()
  "Create a daily journal file organized by year and week number for tomorrow."
  (interactive)

  (let* ((current-time (current-time))
         ;; Calculate tomorrow's time by adding one day (86400 seconds)
         (tomorrow-time (time-add current-time (seconds-to-time (* 24 60 60))))
         (decoded-time (decode-time tomorrow-time)) ;; Use tomorrow-time

         ;; Get the year for tomorrow (like 2025)
         (year (format-time-string "%Y" tomorrow-time))

         ;; Get week number for tomorrow (1-53) - using %V instead of %U
         ;; %V gives ISO week number where weeks start on Monday
         (week-number (string-to-number (format-time-string "%V" tomorrow-time)))

         ;; Get friendly date format for tomorrow like "August 04, 2025"
         (date-string (format-time-string "%B %d, %Y" tomorrow-time))

         ;; Create folder paths
         (year-dir (expand-file-name year "~/Notes/org/journal/"))
         (week-dir (expand-file-name (format "Week %d" week-number) year-dir))

         ;; Create file path/name
         (file-path (expand-file-name (concat date-string ".org") week-dir)))

    ;; Step 2: Make sure folders exist
    (unless (file-exists-p year-dir)
      (make-directory year-dir t))

    (unless (file-exists-p week-dir)
      (make-directory week-dir t))

    ;; Step 3: Create the file (or open it if it exists)
    (find-file file-path)

    ;; Step 4: Insert template if file is empty
    (when (= (buffer-size) 0)
      (yas-expand-snippet
       (with-temp-buffer
         (insert-file-contents "~/.config/doom/snippets/daily")
         (buffer-string))))))

;; Set archive location to done.org under current date
(defun my/archive-done-task ()
  "Archive current task to done.org under today's date"
  (interactive)
  (let* ((date-header (format-time-string "%Y-%m-%d %A"))
         (archive-file (expand-file-name "~/Notes/org/done.org"))
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
  (let* ((done-file (expand-file-name "~/Notes/org/done.org"))
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

;; Keybinds for org mode
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c C-x C-a") 'my/archive-done-task)
  (define-key org-mode-map (kbd "C-c e") #'org-set-effort)
  (define-key org-mode-map (kbd "C-c i") #'org-clock-in)
  (define-key org-mode-map (kbd "C-c o") #'org-clock-out))

(let ((private-config (expand-file-name "private/org-gcal-credentials.el" doom-private-dir)))
  (when (file-exists-p private-config)
    (load private-config)))

(after! tree-sitter
  (require 'tree-sitter-langs)
  (add-to-list 'tree-sitter-major-mode-language-alist '(org-mode . go)))

;; enable all analyzers; not done by default
(after! lsp-mode
  (setq  lsp-go-analyses '((fieldalignment . t)
                            (nilness . t)
                           (shadow . t)
                           (unusedparams . t)
                           (unusedwrite . t)
                           (useany . t)
                           (unusedvariable . t)))
  )


;; Custom keymaps
(map! :leader
      ;; Magit mode mappngs
      (:prefix ("g" . "magit")  ; Use 'g' as the main prefix
       :desc "Stage all files"          "a" #'magit-stage-modified
       :desc "Push"                     "P" #'magit-push
       :desc "Pull"                     "p" #'magit-pull
       :desc "Merge"                    "m" #'magit-merge
       :desc "Quick commit and push"    "z" #'my/magit-stage-commit-push
       )
      ;; Org mode mappings
      (:prefix("y" . "org-mode-specifics")
       :desc "Export as markdown"               "e" #'org-md-export-as-markdown
       :desc "Preview markdown file"            "p" #'markdown-preview
       :desc "Export as html"                   "h" #'org-html-export-as-html
       :desc "Export as LaTeX then PDF"         "l" #'org-latex-export-to-pdf
       :desc "Find definition"                  "f" #'lsp-find-definition
       )
      ;; Various other commands
      (:prefix("o" . "open")
       :desc "Calendar"                  "c" #'=calendar
       ))

(require 'org-caldav)

(setq org-caldav-url "https://100.78.236.53/remote.php/dav/calendars/admin")
(setq org-caldav-calendar-id "nextcal")
(setq org-caldav-inbox "~/Notes/org/agenda.org")
(setq org-icalendar-include-todo 'all
      org-caldav-sync-todo t)
(setq org-icalendar-timezone "America/Chicago")

;;Org-Roam
;; Org-Roam Configuration with SQLite Built-in Connector
(use-package! org-roam
  :custom
  ;; Set your org-roam directory
  (org-roam-directory "~/Notes/org/roam/")

  ;; Explicitly use the built-in SQLite connector
  (org-roam-database-connector 'sqlite-builtin)

  ;; Set an absolute path for the database file
  (org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory))

  :config
  ;; Make sure the directory exists
  (unless (file-exists-p org-roam-directory)
    (make-directory org-roam-directory t))

  ;; Add error handling for database operations
  (advice-add 'org-roam-db-query :around
              (lambda (fn &rest args)
                (condition-case err
                    (apply fn args)
                  (error
                   (message "Database error in org-roam: %S" err)
                   nil))))

  ;; Enable auto-sync mode to keep the database updated
  (org-roam-db-autosync-mode +1))
                                        ;
;; Org-Roam UI setup - only load after org-roam is properly initialized
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; org-download customizations
(require 'org-download)
(setq-default org-download-screenshot-method "scrot -s %s")

;; Debugging function for SQLite issues
(defun debug-org-roam-db ()
  "Debug function to test org-roam database connection."
  (interactive)
  (message "Testing org-roam database...")
  (message "Directory exists: %s" (file-exists-p org-roam-directory))
  (message "Database path: %s" org-roam-db-location)
  (message "Database connector: %s" org-roam-database-connector)
  (condition-case err
      (progn
        (org-roam-db-sync)
        (message "Database synced successfully!"))
    (error (message "Database sync error: %S" err))))
                                        ;
;; rust dev
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
  (lsp-idle-delay 0.6)
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

;; rust completions
(use-package company
  :ensure
  :custom
  (company-idle-delay 0.5) ;; how long to wait until popup
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
