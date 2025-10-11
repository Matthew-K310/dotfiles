;; EMMS full configuration with Nord theme, centered layout, and swaync notifications
(emms-all)
(emms-default-players)
(emms-mode-line-mode 1)
(emms-playing-time-mode 1)

;; Basic settings
(setq emms-source-file-default-directory "~/Sync/Music"
      emms-browser-covers #'emms-browser-cache-thumbnail-async
      emms-browser-thumbnail-small-size 64
      emms-browser-thumbnail-medium-size 128
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

;; MPD integration
(require 'emms-player-mpd)
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port "6600")
(setq emms-player-mpd-music-directory (expand-file-name "~/Sync/Music"))

;; Connect to MPD and add it to player list and info functions
(add-to-list 'emms-player-list 'emms-player-mpd)
(add-to-list 'emms-info-functions 'emms-info-mpd)
(emms-player-mpd-connect)

(defun my/update-emms-from-mpd ()
  "Update EMMS cache from MPD and refresh browser."
  (interactive)
  (message "Updating EMMS cache from MPD...")
  (emms-player-mpd-connect)
  (emms-cache-set-from-mpd-all)
  (message "EMMS cache updated. Refreshing browser...")
  (when (get-buffer "*EMMS Browser*")
    (with-current-buffer "*EMMS Browser*"
      (emms-browser-refresh))))

;; Add margins and spacing for better layout
(defun emms-center-buffer-in-frame ()
  "Add margins to center the EMMS buffer in the frame."
  (let* ((window-width (window-width))
         (desired-width 80)  ;; Desired text width
         (margin (max 0 (/ (- window-width desired-width) 2))))
    (setq-local left-margin-width margin)
    (setq-local right-margin-width margin)
    ;; Add line spacing for better readability
    (setq-local line-spacing 0.2)
    (set-window-buffer (selected-window) (current-buffer))))
;;
;; Ensure browser functionality
(setq emms-browser-default-browse-type 'album)
;; (add-to-list 'emms-info-functions 'emms-info-mp3info)
;; (add-to-list 'emms-info-functions 'emms-info-ogginfo)
(add-to-list 'emms-info-functions 'emms-info-metaflac)
(add-to-list 'emms-info-functions 'emms-info-tinytag)

;; Ensure tracks play when selected
(define-key emms-browser-mode-map (kbd "RET") 'emms-browser-add-tracks-and-play)
(define-key emms-browser-mode-map (kbd "SPC") 'emms-pause)

;; Your keybindings
(after! emms
  (map! :leader
        (:prefix ("m" . "music/EMMS")
         :desc "Update from MPD" "u" #'my/update-emms-from-mpd
         :desc "Play at directory tree"   "d" #'emms-play-directory-tree
         :desc "Go to emms playlist"      "m" #'emms-playlist-mode-go
         :desc "Shuffle"                  "s" #'emms-shuffle
         :desc "Emms pause track"         "p" #'emms-pause
         :desc "Emms stop track"          "x" #'emms-stop
         :desc "Emms play previous track" "," #'emms-previous
         :desc "EMMS Browser"             "o" #'emms-browser
         :desc "Emms play next track"     "." #'emms-next)))

;; Enhanced cover art function (used by both browser and notifications)
(defun emms-cover-art-path ()
  "Return the path of the cover art for the current track."
  (let* ((track (emms-playlist-current-selected-track))
         (path (emms-track-get track 'name))
         (dir (file-name-directory path))
         ;; Check standard cover filenames first
         (standard-files '("cover.jpg" "cover.png" "folder.jpg" "folder.png"
                           "album.jpg" "album.png" "front.jpg" "front.png"))
         (standard-cover (cl-find-if
                          (lambda (file)
                            (file-exists-p (expand-file-name file dir)))
                          standard-files)))
    (if standard-cover
        (expand-file-name standard-cover dir)
      ;; If standard files aren't found, try any image in the directory
      (let ((cover-files (directory-files dir nil ".*\\(jpg\\|png\\|jpeg\\)$")))
        (when cover-files
          (expand-file-name (car cover-files) dir))))))

;; Swaync notification function with cover art
(defun emms-notify-song-change-with-artwork ()
  "Send song change notification with album artwork to swaync via libnotify"
  (let* ((track (emms-playlist-current-selected-track))
         (artist (or (emms-track-get track 'info-artist) "Unknown Artist"))
         (title (or (emms-track-get track 'info-title) "Unknown Title"))
         (album (or (emms-track-get track 'info-album) "Unknown Album"))
         ;; Use our existing cover art function
         (cover-image (emms-cover-art-path)))

    ;; Send notification with artwork if available
    (apply #'start-process
           "emms-notify" nil "notify-send"
           "-a" "EMMS"               ;; Application name
           "-c" "music"              ;; Category
           (append
            ;; Add artwork if found
            (when cover-image
              (list "-i" cover-image))
            ;; Summary and body
            (list
             (format "Now Playing: %s" title)
             (format "Artist: %s\nAlbum: %s" artist album))))))

;; Add the notification function to hook
(add-hook 'emms-player-started-hook 'emms-notify-song-change-with-artwork)

(provide 'emms-config)
