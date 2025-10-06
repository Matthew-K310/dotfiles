;;; ../../.dotfiles/.config/doom/lisp/mu4e-config.el -*- lexical-binding: t; -*-

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

(provide 'mu4e-config)
