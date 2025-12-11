;;; blog-post.el -*- lexical-binding: t; -*-

(defun blog/new-post (title)
  "Create a new blog post in `~/org/blog/` with TITLE.
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
    (when (= (buffer-size) 0)
      (yas-expand-snippet
       (with-temp-buffer
         (insert-file-contents "~/.config/doom/snippets/org-mode/fm")
         (buffer-string)))
      ;; After snippet expansion, fill in the title
      (when (and (boundp 'yas--active-snippets) yas--active-snippets)
        (insert title)
        (yas-next-field)))))

(provide 'blog-post)
