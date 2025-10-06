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

(map! :leader
      :prefix ("e" . "elfeed")
      :desc "Open elfeed"         "e" #'elfeed
      :desc "Update elfeed"       "u" #'elfeed-update
      :desc "Open elfeed-tube-mpv" "t" #'elfeed-tube-mpv)

(provide 'elfeed-config)
