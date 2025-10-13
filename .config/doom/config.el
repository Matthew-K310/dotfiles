;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Matthew Kennedy"
      user-mail-address "it@matthew-kennedy.com")

(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo")
      auth-source-cache-expiry nil) ; default is 7200 (2h)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 14)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 22))

;; Check the system type and load themes accordingly
;; (cond
;; ((eq system-type 'darwin)  ;; macOS
;;  (load-theme 'doom-nord t))      ;; Load Nord theme on macOS
;; ((eq system-type 'gnu/linux)  ;; Linux
;;  (load-theme 'ewal-spacemacs-modern t)))  ;; Load Spacemacs theme on Linux
 (load-theme 'doom-nord t)
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

;; (assoc-delete-all "Reload last session" +doom-dashboard-menu-sections)
(assoc-delete-all "Jump to bookmark" +doom-dashboard-menu-sections)
(assoc-delete-all "Open documentation" +doom-dashboard-menu-sections)

;; Relative line numbers
(setq display-line-numbers-type `relative)

;; Better readability while scrolling
(setq scroll-margin 40)

;; Speed of which-key popup
(setq which-key-idle-delay 0.1)

;; Set tab width
(setq-default tab-width 4)

;; Set browser for opening links
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "chromium")
;; (setq browse-url-generic-program "librewolf")
;; (setq browse-url-generic-program "qutebrowser")

;; Change focus highlight mode
'((prog-mode . defun) (text-mode . paragraph))

(setq tramp-default-method "ssh")

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
      ;; elfeed keybinds
      (:prefix ("e" . "elfeed")
      :desc "Open elfeed"         "e" #'elfeed
      :desc "Update elfeed"       "u" #'elfeed-update
      :desc "Open elfeed-tube-mpv" "t" #'elfeed-tube-mpv)

      ;; Magit mode mappings
      (:prefix ("g" . "magit")
       :desc "Stage all files"          "a" #'magit-stage-modified
       :desc "goto function definition" "d" #'evil-goto-definition
       :desc "Push"                     "P" #'magit-push
       :desc "Pull"                     "p" #'magit-pull
       :desc "Merge"                    "m" #'magit-merge
       :desc "Quick commit and push"    "z" #'my/magit-stage-commit-push)

      ;; emms keybinds
      (:prefix ("m" . "music/EMMS")
       :desc "Update from MPD" "u" #'my/update-emms-from-mpd
       :desc "Play directory tree" "d" #'emms-play-directory-tree
       :desc "Shuffle playlist" "h" #'emms-shuffle
       :desc "Pause track" "p" #'emms-pause
       :desc "Stop track" "s" #'emms-stop
       :desc "Previous track" "b" #'emms-previous
       :desc "Next track" "n" #'emms-next
       :desc "Open Browser" "o" #'emms-browser)

      (:prefix ("n" . "notes")
        :desc "Insert Noter Annotation" "i" #'org-noter-insert-note
        (:prefix ("r" . "roam")
         :desc "Find Roam Node"    "f" #'org-roam-node-find
         :desc "Insert Roam Node"  "i" #'org-roam-node-insert
         :desc "Toggle Roam Buffer" "t" #'org-roam-buffer-toggle))

      ;; open calendar
      (:prefix ("o" . "open")
       :desc "Calendar" "c" #'=calendar)

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

(require 'org)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes")
(setq diary-file "~/Notes/agenda.org")
;; (add-to-list 'org-agenda-files "~/Notes/agenda.org")

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

;; next week's journal
(defun create-next-weeks-journal-file ()
  "Create a weekly journal file for NEXT week for review and habit tracking."
  (interactive)

  (let* ((next-week-time (time-add (current-time) (days-to-time 7))) ; Add 7 days
         ;; Get the year (like 2025)
         (year (format-time-string "%Y" next-week-time))

         ;; Get ISO week number (01–53, starts on Monday)
         (week-number (string-to-number (format-time-string "%V" next-week-time)))

         ;; Filename like "Week 33, 2025"
         (date-string (format "Week %02d, %s" week-number year))

         ;; Folder paths
         (year-dir (expand-file-name year "~/Notes/journal/"))
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

         ;; Get week number (1-53) - using %V for ISO week number
         (week-number (string-to-number (format-time-string "%V" current-time)))

         ;; Get friendly date format like "Monday, March 24, 2025"
         (date-string (format-time-string "%A, %B %d, %Y" current-time))

         ;; Create folder paths
         (year-dir (expand-file-name year "~/Notes/journal/"))
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
         (date-string (format-time-string "%A, %B %d, %Y" tomorrow-time))

         ;; Create folder paths
         (year-dir (expand-file-name year "~/Notes/journal/"))
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
         (archive-file (expand-file-name "~/Notes/done.org"))
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
  (let* ((done-file (expand-file-name "~/Notes/done.org"))
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
(setq org-roam-directory (expand-file-name "~/Notes/roam")
      +org-roam-dir      (expand-file-name "~/Notes/roam")
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

;; Capture templates
(after! org
  (setq org-capture-templates
        '(("t" "Todo" entry
           (file+headline "~/Notes/inbox.org" "Inbox")
           "* TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("e" "Event" entry
           (file+headline "~/Notes/agenda.org" "Events")
           "* %^{Event}\n%^{SCHEDULED}T\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("d" "Deadline" entry
           (file+headline "~/Notes/agenda.org" "Deadlines")
           "* TODO %^{Task}\nDEADLINE: %^{Deadline}T\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("p" "Project" entry
           (file+headline "~/Notes/projects.org" "Projects")
           "* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n** TODO %?")

          ("i" "Idea" entry
           (file+headline "~/Notes/ideas.org" "Ideas")
           "** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("c" "Contact" entry
           (file+headline "~/Notes/contacts.org" "Inbox")
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

          ("g" "Issue" entry
           (file+olp+datetree "~/Notes/issues.org" "Inbox")
           "* TODO %?\n :PROPERTIES:\n :ID: %(org-id-new)\n :CREATED: %U\n :END:\n
SCHEDULED: %t\n :LOGBOOK:\n - State \"TODO\" from \"\" %U\n :END:"
           :time-prompt t
           :prepend t)

          ("b" "Blog" entry
           (file+olp+datetree "~/Notes/blog/" "Inbox")
           "* TODO %?\n :PROPERTIES:\n :ID: %(org-id-new)\n :CREATED: %U\n :END:\n
SCHEDULED: %t\n :LOGBOOK:\n - State \"TODO\" from \"\" %U\n :END:"
           :time-prompt t
           :prepend t)

          ("n" "Note" entry
           (file+headline "~/Notes/notes.org" "Inbox")
           "* [%<%Y-%m-%d %a>] %^{Title}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?"
           :prepend t))))

(require 'org-caldav)
;; URL of the caldav server
(setq org-caldav-url "https://nextcloud.matthewcloud.us/remote.php/dav/calendars/matthewkennedy")
;; calendar ID on server
(setq org-caldav-calendar-id "org-calendar")
;; Org filename where new entries from calendar stored
(setq org-caldav-inbox "~/Notes/calendar.org")
(setq org-caldav-files '("~/Notes/agenda.org"))
;; Usually a good idea to set the timezone manually
(setq org-icalendar-timezone "US/Chicago")

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c C-x C-a") 'my/archive-done-task)
  (define-key org-mode-map (kbd "C-c n l") #'org-roam-buffer-toggle)
  (define-key org-mode-map (kbd "C-c n i") #'org-roam-node-insert)
  (define-key org-mode-map (kbd "C-c e") #'org-set-effort)
  (define-key org-mode-map (kbd "C-c i") #'org-clock-in)
  (define-key org-mode-map (kbd "C-c o") #'org-clock-out)
  (define-key org-mode-map (kbd "C-c n b") #'blog/new-post)
  (define-key org-mode-map (kbd "C-c b d") #'blog/clear-publishing-directory)
  (define-key org-mode-map (kbd "C-c b e") #'org-publish))

;; random global bind lol
(global-set-key (kbd "C-c n f") #'org-roam-node-find)

;; Blog export configuration for Org-publish
(defun blog/sitemap-format-entry (entry style project)
  "Format each post entry in the sitemap.
ENTRY is the filename, STYLE is ignored, PROJECT is the current publishing project."
  (format "[[file:%s][%s]] — %s"
          entry
          (org-publish-find-title entry project)
          (format-time-string "%Y-%m-%d"
                              (org-publish-find-date entry project))))

(setq org-publish-use-timestamps-flag nil)

(setq org-publish-project-alist
      '(("blog"
         ;; Root folder for your posts
         :base-directory "~/Notes/blog/"
         :base-extension "org"
         :recursive nil
         ;; Destination (using TRAMP rsync)
         :publishing-directory "/rsync:matthew-kennedy.com:/home/user-data/www/matthew-kennedy.com/"
         ;; Convert Org → HTML
         :publishing-function org-html-publish-to-html
         ;; HTML options
         :section-numbers nil
         :with-toc nil
         :html-html5-fancy t
         :html-doctype "html5"
         ;; Add CSS globally to every HTML file
         :html-head "<link rel=\"stylesheet\" href=\"other/site.css\" type=\"text/css\" />"
         ;; Sitemap (index page)
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "Blog | Matthew Kennedy"
         :sitemap-sort-files anti-chronologically
         :sitemap-format-entry blog/sitemap-format-entry)

        ;; Static files: CSS, images, JS, etc.
        ("blog-static"
         :base-directory "~/Notes/blog/other"
         :base-extension "css\\|png\\|jpg\\|gif\\|svg\\|js"
         :publishing-directory "/rsync:matthew-kennedy.com:/home/user-data/www/matthew-kennedy.com/other"
         :publishing-function org-publish-attachment
         :recursive t)

        ;; Meta-project to publish everything
        ("website" :components ("blog" "blog-static"))))

(defun blog/clear-publishing-directory ()
  "Delete all files in the publishing directory."
  (interactive)
  (let ((dir "/rsync:matthew-kennedy.com:/home/user-data/www/matthew-kennedy.com/"))
    (when (yes-or-no-p (format "Delete ALL files in %s? " dir))
      (dolist (f (directory-files dir t "^[^.]" t))
        (if (file-directory-p f)
            (delete-directory f t)
          (delete-file f))))))

(defun blog/new-post (title)
  "Create a new blog post in `~/Notes/blog/posts/` with TITLE.
Inserts Org front-matter and opens the file."
  (interactive "sPost title: ")
  (let* ((slug (downcase
                (replace-regexp-in-string "[^a-z0-9]+" "-" title)))
         (date (format-time-string "%Y%m%d%H%M%s"))
         (filename (format "%s-%s.org" date slug))
         (dir "~/Notes/blog/")
         (filepath (expand-file-name filename dir)))
    (unless (file-exists-p dir)
      (make-directory dir t))
    (find-file filepath)
    (unless (file-exists-p filepath)
      (insert (format "#+TITLE: %s\n#+DATE: %s\n#+TAGS: \n#+OPTIONS: toc:nil num:nil\n\n"
                      title date))
      (save-buffer))))

;; Enable tab-bar
(tab-bar-mode 1)
(tab-bar-history-mode 1)

(setq
 tab-bar-new-tab-choice "*scratch*"          ; default buffer for new tabs
 tab-bar-close-button-show nil
 tab-bar-new-button-show nil
 tab-bar-tab-hints t                         ; show tab numbers
 tab-bar-show 1                              ; only show bar if >1 tab
 tab-bar-new-tab-to 'rightmost
 tab-bar-format '(tab-bar-format-history
                  tab-bar-format-tabs
                  tab-bar-separator
                  tab-bar-format-align-right
                  tab-bar-format-global))

;; Smarter tab naming — show project or buffer
(defun my/tab-bar-tab-name ()
  "Return a name for the tab: project or current buffer."
  (let* ((proj (when (fboundp 'project-current)
                 (when-let ((p (project-current)))
                   (file-name-nondirectory
                    (directory-file-name (project-root p))))))
         (buf (buffer-name (window-buffer (minibuffer-selected-window)))))
    (if proj (format " %s " proj)
      (format " %s " buf))))
(setq tab-bar-tab-name-function #'my/tab-bar-tab-name)

;; Helper: create tab N if missing, then switch
(defun my/tab-bar-select-or-create (n)
  "Switch to tab N, creating it if it doesn't exist."
  (interactive "nTab number: ")
  (let* ((tabs (tab-bar-tabs))
         (count (length tabs)))
    (if (<= n count)
        (tab-bar-select-tab n)
      (dotimes (_ (- n count))
        (tab-bar-new-tab))
      (tab-bar-select-tab n))))

;; DWM-style bindings M-1 .. M-9
(dotimes (i 9)
  (let ((n (1+ i)))
    (global-set-key (kbd (format "M-%d" n))
                    `(lambda () (interactive)
                       (my/tab-bar-select-or-create ,n)))))

;; Optional: cycle and rename
(global-set-key (kbd "M-[") #'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "M-]") #'tab-bar-switch-to-next-tab)
(global-set-key (kbd "M-`") #'tab-bar-rename-tab)

;; --- Ensure vterm doesn't override the keys ---
(with-eval-after-load 'vterm
  (defun my/vterm-tab-bar-bindings ()
    "Let M-1..M-9 switch tabs even inside vterm."
    (dotimes (i 9)
      (let ((n (1+ i)))
        (define-key vterm-mode-map
          (kbd (format "M-%d" n))
          `(lambda () (interactive)
             (my/tab-bar-select-or-create ,n))))))
  (add-hook 'vterm-mode-hook #'my/vterm-tab-bar-bindings))

;;; --- Persistent tab-bar setup ---

(setq user-emacs-directory "~/.config/doom/")
(setq desktop-path '("~/.config/doom/"))
(setq desktop-auto-save-timeout 30)
(setq desktop-save 'if-exists)
(setq desktop-restore-frames t)

(desktop-save-mode 1)

(defun my/tab-state-file ()
  "Return the file path for saved tabs."
  (expand-file-name "tabs.el" user-emacs-directory))

(defun my/save-tab-state ()
  "Save current tab-bar tabs to ~/.config/doom/tabs.el."
  (interactive)
  (let ((file (my/tab-state-file)))
    (with-temp-file file
      (prin1 (tab-bar-tabs) (current-buffer)))
    (message "Saved tab state to %s" file)))

(defun my/load-tab-state ()
  "Load tab-bar tabs from ~/.config/doom/tabs.el."
  (interactive)
  (let ((file (my/tab-state-file)))
    (if (file-exists-p file)
        (let ((tabs (with-temp-buffer
                      (insert-file-contents file)
                      (read (current-buffer)))))
          (setq tab-bar-tabs tabs)
          (tab-bar--update-tab-bar-lines)
          (message "Restored %d tabs" (length tabs)))
      (message "No saved tab state found at %s" file))))

(add-hook 'kill-emacs-hook #'my/save-tab-state)
(add-hook 'emacs-startup-hook #'my/load-tab-state)

(global-set-key (kbd "C-c w s") #'my/save-tab-state)
(global-set-key (kbd "C-c w l") #'my/load-tab-state)

(require 'emms-setup)
(emms-all)
(emms-default-players)
(emms-mode-line-mode 1)
(emms-playing-time-mode 1)

(setq emms-source-file-default-directory "~/Sync/Music"
      emms-browser-covers #'emms-browser-cache-thumbnail-async
      emms-browser-thumbnail-small-size 64
      emms-browser-thumbnail-medium-size 128
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

(require 'emms-player-mpd)
(setq emms-player-mpd-server-name "localhost"
      emms-player-mpd-server-port "6600"
      emms-player-mpd-music-directory (expand-file-name "~/Sync/Music"))

(add-to-list 'emms-player-list 'emms-player-mpd)
(add-to-list 'emms-info-functions 'emms-info-mpd)

(defun my/emms-mpd-connect ()
  "Safely (re)connect to MPD without throwing errors."
  (ignore-errors (emms-player-mpd-connect)))

(my/emms-mpd-connect)

(defun my/update-emms-from-mpd ()
  "Update EMMS cache from MPD and refresh browser."
  (interactive)
  (message "Updating EMMS cache from MPD...")
  (my/emms-mpd-connect)
  (emms-cache-set-from-mpd-all)
  (message "EMMS cache updated. Refreshing browser...")
  (when (get-buffer "*EMMS Browser*")
    (with-current-buffer "*EMMS Browser*"
      (emms-browser-refresh))))

(setq emms-player-list '(emms-player-mpd
                         emms-player-mplayer
                         emms-player-vlc
                         emms-player-mpg321
                         emms-player-ogg123))

(require 'emms-browser)
(setq emms-browser-default-browse-type 'info-artist)
(setq emms-browser-current-browse-type 'info-artist)

(add-to-list 'emms-info-functions 'emms-info-mp3info)
(add-to-list 'emms-info-functions 'emms-info-ogginfo)
(add-to-list 'emms-info-functions 'emms-info-metaflac)
(add-to-list 'emms-info-functions 'emms-info-tinytag)

(with-eval-after-load 'emms-browser
  (define-key emms-browser-mode-map (kbd "RET") #'emms-browser-add-tracks-and-play))
;; (define-key emms-browser-mode-map (kbd "SPC") #'emms-pause))

(add-hook 'window-size-change-functions
          (lambda (_)
            (when (memq major-mode '(emms-browser-mode emms-playlist-mode))
              (emms-center-buffer-in-frame))))

(defun emms-cover-art-path ()
  "Return the path of the cover art for the current track."
  (let* ((track (emms-playlist-current-selected-track))
         (path (emms-track-get track 'name))
         (dir (file-name-directory path))
         (standard-files '("cover.jpg" "cover.png" "folder.jpg" "folder.png"
                           "album.jpg" "album.png" "front.jpg" "front.png"))
         (standard-cover (seq-find (lambda (f)
                                     (file-exists-p (expand-file-name f dir)))
                                   standard-files)))
    (if standard-cover
        (expand-file-name standard-cover dir)
      (let ((cover-files (directory-files dir nil ".*\\(jpg\\|png\\|jpeg\\)$")))
        (when cover-files
          (expand-file-name (car cover-files) dir))))))

(defun emms-notify-song-change-with-artwork ()
  "Send song change notification with album artwork to swaync via libnotify."
  (let* ((track (emms-playlist-current-selected-track))
         (artist (or (emms-track-get track 'info-artist) "Unknown Artist"))
         (title (or (emms-track-get track 'info-title) "Unknown Title"))
         (album (or (emms-track-get track 'info-album) "Unknown Album"))
         (cover (emms-cover-art-path)))
    (apply #'start-process
           "emms-notify" nil "notify-send"
           "-a" "EMMS" "-c" "music"
           (append (when cover (list "-i" cover))
                   (list (format "Now Playing: %s" title)
                         (format "Artist: %s\nAlbum: %s" artist album))))))

(add-hook 'emms-player-started-hook #'emms-notify-song-change-with-artwork)

;; Ensure elfeed DB directory exists
(make-directory "~/.local/share/elfeed" t)

;; Load elfeed-org safely
(use-package! elfeed-org
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files '("~/.config/doom/elfeed.org")))

;; Consolidated Elfeed configuration
(after! elfeed
  ;; DB directory
  (setq elfeed-db-directory "~/.local/share/elfeed"
        elfeed-search-filter "@3-weeks-ago +unread -4chan -news -Reddit")

  ;; Define elfeed-download directories
  (defvar elfeed-download-base-dir "~/Downloads/Elfeed/"
    "Base directory for downloaded content.")
  (defvar elfeed-download-youtube-dir "youtube/"
    "Subdirectory for YouTube videos (relative to base dir).")
  (defvar elfeed-download-articles-dir "articles/"
    "Subdirectory for articles (relative to base dir).")
  (defvar elfeed-download-node-script-path
    (expand-file-name "~/.config/scripts/save-article.js")
    "Path to Node.js Playwright script for saving articles as PDFs.")

  ;; Helper functions
  (defun elfeed-download--ensure-directory (dir)
    "Ensure directory DIR exists."
    (unless (file-exists-p dir)
      (make-directory dir t)))

  (defun elfeed-download--sanitize-filename (filename)
    "Sanitize FILENAME for safe filesystem use."
    (replace-regexp-in-string "[^a-zA-Z0-9-_. ]" "_" filename))

  (defun elfeed-download--get-youtube-dir ()
    (expand-file-name elfeed-download-youtube-dir elfeed-download-base-dir))

  (defun elfeed-download--get-articles-dir ()
    (expand-file-name elfeed-download-articles-dir elfeed-download-base-dir))

  ;; Download functions
  (defun elfeed-download-youtube (url title)
    (let ((dir (elfeed-download--get-youtube-dir)))
      (elfeed-download--ensure-directory dir)
      (start-process "yt-dlp" "*yt-dlp*" "yt-dlp"
                     "-o" (concat dir "%(title)s.%(ext)s")
                     url)))

  (defun elfeed-download-article (url title)
    (let* ((dir (elfeed-download--get-articles-dir))
           (safe-title (elfeed-download--sanitize-filename title))
           (pdf-file (concat dir safe-title ".pdf")))
      (elfeed-download--ensure-directory dir)
      (start-process "playwright-pdf" "*pdf-gen*" "node"
                     elfeed-download-node-script-path url pdf-file)))

  ;; Main entry download function
  (defun elfeed-download-current-entry ()
    "Download current elfeed entry and mark as read."
    (interactive)
    (let ((entries (elfeed-search-selected)))
      (when entries
        (let* ((entry (if (listp entries) (car entries) entries))
               (url (elfeed-entry-link entry))
               (title (elfeed-entry-title entry)))
          (cond
           ((string-match-p "youtube\\.com\\|youtu\\.be" url)
            (elfeed-download-youtube url title))
           (t
            (elfeed-download-article url title)))
          (elfeed-untag entry 'unread)
          (elfeed-tag entry 'read)
          (elfeed-search-update-entry entry)
          (message "Downloaded and marked: %s" title)
          (forward-line 1)))))

  ;; Setup function
  (defun elfeed-download-setup ()
    "Create directories and bind keys."
    (interactive)
    (elfeed-download--ensure-directory elfeed-download-base-dir)
    (elfeed-download--ensure-directory (elfeed-download--get-youtube-dir))
    (elfeed-download--ensure-directory (elfeed-download--get-articles-dir))
    ;; Key binding
    (map! :map elfeed-search-mode-map
          :n "d" #'elfeed-download-current-entry)
    (message "elfeed-download setup complete!"))

  ;; Initialize elfeed-download
  (elfeed-download-setup)

  ;; Update hourly
  (run-at-time nil (* 60 60) #'elfeed-update))

;; Elfeed-tube setup
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

(require 'mu4e)
;; SMTP settings:
(setq send-mail-function 'smtpmail-send-it)    ; should not be modified
(setq smtpmail-smtp-server "mail.matthew-kennedy.com") ; host running SMTP server
(setq smtpmail-smtp-service 587)               ; SMTP service port number
(setq smtpmail-stream-type 'starttls)          ; type of SMTP connections to use
;; Mail folders:
(setq mu4e-drafts-folder "/emacs/Drafts")
(setq mu4e-sent-folder   "/emacs/Sent")
(setq mu4e-trash-folder  "/emacs/Trash")
(setq mu4e-archive-folder  "/emacs/Archive")
;; The command used to get your emails (adapt this line, see section 2.3):
(setq mu4e-get-mail-command "mbsync --config ~/.config/doom/.mbsyncrc -a")
;; Further customization:
(setq mu4e-html2text-command "w3m -T text/html" ; how to hanfle html-formatted emails
      mu4e-headers-auto-update t                ; avoid to type `g' to update
      mu4e-view-show-images t                   ; show images in the view buffer
      mu4e-compose-signature-auto-include nil   ; I don't want a message signature
      mu4e-use-fancy-chars t)                   ; allow fancy icons for mail threads

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
