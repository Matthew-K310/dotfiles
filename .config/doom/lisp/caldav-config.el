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

(provide 'caldav-config)
