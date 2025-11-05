;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Matthew Kennedy")

(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo")
      auth-source-cache-expiry nil) ; default is 7200 (2h)

;; allow unlocking of GPG keys in mini-buffer
(setq epg-pinentry-mode 'loopback)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 14)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 22))

(add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
;; Check the system type and load themes accordingly
;; (cond
;; ((eq system-type 'darwin)  ;; macOS
;;  (load-theme 'doom-nord t))      ;; Load Nord theme on macOS
;; ((eq system-type 'gnu/linux)  ;; Linux
;;  (load-theme 'ewal-spacemacs-modern t)))  ;; Load Spacemacs theme on Linux
 (load-theme 'compline t)
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

;; (assoc-delete-all "Reload last session" +doom-dashboard-menu-sections)
(assoc-delete-all "Open documentation" +doom-dashboard-menu-sections)

;; Relative line numbers
;; (setq display-line-numbers-type `relative)

;; Better readability while scrolling
(setq scroll-margin 20)

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

;; inbox capture
(defun org-capture-inbox ()
     (interactive)
     (call-interactively 'org-store-link)
     (org-capture nil "n"))

(define-key global-map (kbd "C-c f") 'org-capture-inbox)

;; random global bind lol
(global-set-key (kbd "C-c n f") #'org-roam-node-find)

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

(require 'org)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes")
(setq diary-file "~/notes/calendar.org")
;; (setq diary-file "~/notes/agenda.org")

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
         (year-dir (expand-file-name year "~/notes/org/journal/"))
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
         (year-dir (expand-file-name year "~/notes/journal/"))
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
         (year-dir (expand-file-name year "~/notes/journal/"))
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
         (year-dir (expand-file-name year "~/notes/journal/"))
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
         (archive-file (expand-file-name "~/notes/done.org"))
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
  (let* ((done-file (expand-file-name "~/notes/done.org"))
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
(setq org-roam-directory (expand-file-name "~/notes/roam")
      +org-roam-dir      (expand-file-name "~/notes/roam")
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

(defun hm/convert-org-to-docx-with-pandoc ()
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

(setq org-agenda-diary-file "~/notes/agenda.org")

(setq org-agenda-files
      (append org-agenda-files
              '("~/notes/calendar.org"
                "~/notes/agenda.org"
                "~/notes/inbox.org"
                "~/notes/todo.org"
                "~/notes/projects.org")))

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "STRT(s)" "WAIT(w)" "HOLD(h)" "WORK(W)""|" "DONE(d)")))

(setq org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
         ((agenda ""
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-deadline-warning-days 0)))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format "  %?-12t% s")
                      (org-agenda-overriding-header "\nInbox\n")))
          ;; (todo "TODO"
          ;;       ((org-agenda-skip-function
          ;;         '(org-agenda-skip-entry-if 'deadline))
          ;;        (org-agenda-prefix-format "  %?-12t% s")
          ;;        (org-agenda-overriding-header "\nTasks\n")))
         (agenda ""
                  ((org-agenda-overriding-header "\nWork Schedule")
                   (org-agenda-entry-types '(:scheduled))
                   (org-agenda-format-date "%A, %B %d")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'notregexp "^*+ WORK"))
                   (org-deadline-warning-days 7)
                   (org-agenda-files '("~/notes/calendar.org"))))
         ;; (agenda ""
         ;;         ((org-agenda-overriding-header "\nEvents")
         ;;          (org-agenda-entry-types '(:scheduled))
         ;;          (org-agenda-format-date "%A, %B %d")
         ;;          (org-agenda-skip-function
         ;;           '(org-agenda-skip-entry-if 'regexp "^*+ WORK"))
         ;;          (org-deadline-warning-days 7)
         ;;          (org-agenda-files '("~/notes/calendar.org"))))
         (agenda ""
                  ((org-agenda-overriding-header "\nDeadlines")
                   (org-agenda-entry-types '(:deadline))
                   (org-agenda-format-date "%A, %B %d")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
                   (org-deadline-warning-days 7)
                   (org-agenda-files '("~/notes/calendar.org"
                                       "~/notes/projects.org"
                                       "~/notes/todo.org"))))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "\nCompleted today\n"))))
         ((org-agenda-files '("~/notes/inbox.org"
                              "~/notes/todo.org"
                              "~/notes/projects.org"
                              "~/notes/agenda.org"
                              "~/notes/calendar.org"))))))

;; Capture templates
(after! org
  (setq org-capture-templates
        '(("t" "Todo" entry
           (file+headline "~/notes/inbox.org" "Inbox")
           "* TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

          ("e" "Event" entry
           (file+headline "~/notes/calendar.org" "Events")
           ;; "* %^{Event}\n%^{SCHEDULED}T\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")
           "* %^{Event}\nSCHEDULED: %^T\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")

          ("d" "Deadline" entry
           (file+headline "~/notes/calendar.org" "Deadlines")
           "* TODO %^{Task}\nDEADLINE: %^{Deadline}T\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")

          ("w" "Work" entry
           (file+headline "~/notes/calendar.org" "Events")
           ;; "* %^{Event}\n%^{SCHEDULED}T\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")
           "* WORK %^{Event}\nSCHEDULED: %^T\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")

          ("p" "Project" entry
           (file+headline "~/notes/projects.org" "Projects")
           "* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n** TODO %?")

          ("l" "TIL" entry
           (file+headline "~/notes/til.org" "Learning")
           "* [%<%Y-%m-%d %a>] %^{Title}\n:PROPERTIES:\n:CREATED: %U\n:TAGS: \n:END:\n%?"
           :prepend t)

          ("n" "Note" entry
           (file+headline "~/notes/inbox.org" "Inbox")
           "* [%<%Y-%m-%d %a>] %^{Title}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?"
           :prepend t)

          ("c" "Contact" entry
           (file+headline "~/notes/contacts.org" "Inbox")
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

(require 'org-caldav)
(setq org-caldav-url "https://cal.matthewcloud.us/matthewkennedy/")
(setq org-caldav-calendar-id "org-calendar")
(setq org-caldav-files '("~/notes/calendar.org"))
(setq org-caldav-inbox "~/notes/inbox.org")
(setq org-caldav-delete-calendar-entries 'never)

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
         :base-directory "~/notes/blog/"
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
         :base-directory "~/notes/blog/other"
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
  "Create a new blog post in `~/notes/blog/posts/` with TITLE.
Inserts Org front-matter and opens the file."
  (interactive "sPost title: ")
  (let* ((slug (downcase
                (replace-regexp-in-string "[^a-z0-9]+" "-" title)))
         (date (format-time-string "%Y%m%d%H%M%s"))
         (filename (format "%s-%s.org" date slug))
         (dir "~/notes/blog/")
         (filepath (expand-file-name filename dir)))
    (unless (file-exists-p dir)
      (make-directory dir t))
    (find-file filepath)
    (unless (file-exists-p filepath)
      (insert (format "#+TITLE: %s\n#+DATE: %s\n#+TAGS: \n#+OPTIONS: toc:nil num:nil\n\n"
                      title date))
      (save-buffer))))

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

(defvar elfeed-download-base-dir (expand-file-name "~/Downloads/Elfeed/")
  "Base directory for all Elfeed downloads.")

(defvar elfeed-download-youtube-dir "youtube/"
  "Subdirectory for YouTube videos (relative to base dir).")

(defvar elfeed-download-articles-dir "articles/"
  "Subdirectory for saved articles (relative to base dir).")

(defvar elfeed-download-node-script-path
  (expand-file-name "~/.config/scripts/save-article.js")
  "Path to Node.js Playwright script that saves articles as PDFs.")

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

(require 'auth-source)
(require 'erc)

(defun run-erc ()
  "Connect to irc.matthewservers.org, reading the password from ~/.authinfo.gpg."
  (interactive)
  (let* ((host "irc.matthewservers.org")
         (port 6697)
         (auth (car (auth-source-search :host host :port port :require '(:secret))))
         (secret (plist-get auth :secret))
         (password (if (functionp secret) (funcall secret) secret)))
    (erc-tls :server host
             :port port
             :nick "mattken"
             :user "mattken/irc.libera.chat"
             :password password)))

;; === Load and core setup ===
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'smtpmail)

(setq
 mu4e-maildir "~/.local/share/mail"
 mu4e-get-mail-command "mbsync --all"
 mu4e-update-interval 300
 mu4e-headers-auto-update t
 mu4e-view-show-images t
 mu4e-compose-signature-auto-include nil
 mu4e-use-fancy-chars t

 ;; Sending mail
 sendmail-program "/usr/bin/msmtp"
 message-send-mail-function 'message-send-mail-with-sendmail

 ;; Context behavior
 mu4e-context-policy 'pick-first
 mu4e-compose-context-policy 'ask

 ;; Quality of life
 mu4e-compose-format-flowed t
 mu4e-view-show-addresses t
 mu4e-change-filenames-when-moving t
 mu4e-attachment-dir "~/cloud/downloads/mail")

;; === Contexts ===
(setq mu4e-contexts
      (list
       ;; Personal
       (make-mu4e-context
        :name "Personal"
        :match-func
        (lambda (msg)
          (when msg
            (string-match-p "matthew@matthew-kennedy.com"
                            (concat (or (mu4e-message-field msg :to) "")
                                    (or (mu4e-message-field msg :from) "")))))
        :vars '((user-mail-address . "matthew@matthew-kennedy.com")
                (user-full-name    . "Matthew Kennedy")
                (mu4e-sent-folder   . "/matthew@matthew-kennedy.com/Sent")
                (mu4e-drafts-folder . "/matthew@matthew-kennedy.com/Drafts")
                (mu4e-trash-folder  . "/matthew@matthew-kennedy.com/Trash")
                (mu4e-refile-folder . "/matthew@matthew-kennedy.com/Archive")))

       ;; IT
       (make-mu4e-context
        :name "IT"
        :match-func
        (lambda (msg)
          (when msg
            (string-match-p "it@matthew-kennedy.com"
                            (concat (or (mu4e-message-field msg :to) "")
                                    (or (mu4e-message-field msg :from) "")))))
        :vars '((user-mail-address . "it@matthew-kennedy.com")
                (user-full-name    . "Matthew Kennedy")
                (mu4e-sent-folder   . "/it@matthew-kennedy.com/Sent")
                (mu4e-drafts-folder . "/it@matthew-kennedy.com/Drafts")
                (mu4e-trash-folder  . "/it@matthew-kennedy.com/Trash")
                (mu4e-refile-folder . "/it@matthew-kennedy.com/Archive")))

       ;; iCloud
       (make-mu4e-context
        :name "iCloud"
        :match-func
        (lambda (msg)
          (when msg
            (string-match-p "matthew_i_kennedy@icloud.com"
                            (concat (or (mu4e-message-field msg :to) "")
                                    (or (mu4e-message-field msg :from) "")))))
        :vars '((user-mail-address . "matthew_i_kennedy@icloud.com")
                (user-full-name    . "Matthew Kennedy")
                (mu4e-sent-folder   . "/icloud/Sent Messages")
                (mu4e-drafts-folder . "/icloud/Drafts")
                (mu4e-trash-folder  . "/icloud/Deleted Messages")
                (mu4e-refile-folder . "/icloud/Archive")))

       ;; Business
       (make-mu4e-context
        :name "Business"
        :match-func
        (lambda (msg)
          (when msg
            (string-match-p "business@matthew-kennedy.com"
                            (concat (or (mu4e-message-field msg :to) "")
                                    (or (mu4e-message-field msg :from) "")))))
        :vars '((user-mail-address . "business@matthew-kennedy.com")
                (user-full-name    . "Matthew Kennedy Productions")
                (mu4e-sent-folder   . "/business@matthew-kennedy.com/Sent")
                (mu4e-drafts-folder . "/business@matthew-kennedy.com/Drafts")
                (mu4e-trash-folder  . "/business@matthew-kennedy.com/Trash")
                (mu4e-refile-folder . "/business@matthew-kennedy.com/Archive")))

       ;; Accounts
       (make-mu4e-context
        :name "Accounts"
        :match-func
        (lambda (msg)
          (when msg
            (string-match-p "accounts@matthew-kennedy.com"
                            (concat (or (mu4e-message-field msg :to) "")
                                    (or (mu4e-message-field msg :from) "")))))
        :vars '((user-mail-address . "accounts@matthew-kennedy.com")
                (user-full-name    . "Matthew Kennedy")
                (mu4e-sent-folder   . "/accounts@matthew-kennedy.com/Sent")
                (mu4e-drafts-folder . "/accounts@matthew-kennedy.com/Drafts")
                (mu4e-trash-folder  . "/accounts@matthew-kennedy.com/Trash")
                (mu4e-refile-folder . "/accounts@matthew-kennedy.com/Archive")))

       ;; Mailing
       (make-mu4e-context
        :name "Mailing"
        :match-func
        (lambda (msg)
          (when msg
            (string-match-p "mailing@matthew-kennedy.com"
                            (concat (or (mu4e-message-field msg :to) "")
                                    (or (mu4e-message-field msg :from) "")))))
        :vars '((user-mail-address . "mailing@matthew-kennedy.com")
                (user-full-name    . "Matthew Kennedy")
                (mu4e-sent-folder   . "/mailing@matthew-kennedy.com/Sent")
                (mu4e-drafts-folder . "/mailing@matthew-kennedy.com/Drafts")
                (mu4e-trash-folder  . "/mailing@matthew-kennedy.com/Trash")
                (mu4e-refile-folder . "/mailing@matthew-kennedy.com/Archive")))))

(use-package emacs-everywhere
  :ensure t)

;; send and receive
(defvar xmpp-daemon-process nil)

(defun xmpp-start-daemon ()
  "Start the Go XMPP daemon in the specified project directory."
  (interactive)
  ;; dir in which to run `go run .`
  ;; (let ((default-directory "/home/matthewkennedy/dev/personal/emacs-xmpp/daemon/"))
  (let ((default-directory "/home/matthewkennedy/dev/personal/emacs-xmpp/"))
    (setq xmpp-daemon-process
          ;; (start-process "xmpp-daemon" "*xmpp-output*" "just" "run"))
          (start-process "xmpp-daemon" "*xmpp-output*" "just" "run"))
    (set-process-filter
     xmpp-daemon-process
     ;; process output to buffer to be read by user (for dev testing)
     (lambda (proc output)
       (with-current-buffer (get-buffer-create "*xmpp-output*")
         (goto-char (point-max))
         (insert output))))))


;; (defun xmpp-send (text)
;;   (interactive "sMessage: ")
;;   (let ((socket (make-network-process
;;                  :name "xmpp-daemon"
;;                  :buffer "*xmpp-daemon*"
;;                  :family 'local
;;                  :service "/tmp/xmpp-daemon.sock")))
;;     (process-send-string socket (concat text "\n"))
;;     (delete-process socket)))

(defun xmpp-send-message (msg)
  "Send MSG to the running Go XMPP client via Unix socket."
  (interactive "sMessage: ")
  (let ((sock "/tmp/xmpp_send.sock"))
    (if (file-exists-p sock)
        (let ((proc (make-network-process
                     :name "xmpp-client"
                     :family 'local
                     :service sock
                     :buffer nil
                     :noquery t)))  ;; don’t prompt when killing Emacs
          (process-send-string proc (concat msg "\n"))
          (delete-process proc))
      (message "Socket not found: %s (is xmpp client running?)" sock))))
