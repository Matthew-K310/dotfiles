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

(provide 'org-mode-config)
