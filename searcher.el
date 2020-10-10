(defun searcher--command-parts ()
  (cond
   ((executable-find "rg")
    '("rg" "--line-number"))
   ((executable-find "ag")
    '("ag" "--nocolor" "--nogroup"))
   ;; you *should* have at least grep installed...
   (t
    '("grep" "--color=never" "-nr"))))

(defun searcher--command (string)
  (let ((parts (searcher--command-parts)))
    `(process-lines ,@parts ,string)))

(defun searcher--directory ()
  (interactive)
  (if (project-current)
      (cdr (project-current))
    default-directory))

(defun searcher ()
  "grep
based on cr-grep from https://www.reddit.com/r/emacs/comments/gixh12/quickly_grepping_project_in_vanilla_fashion/"
  (interactive)
  (let* ((s (read-string "Search term: " (thing-at-point 'word)))
         (default-directory (searcher--directory))
         (results (eval (searcher--command s)))
         (line-list (split-string (completing-read "Result: " results) ":"))
         (f (car line-list))
         (l-num (string-to-number (car (cdr line-list)))))
    (find-file f)
    (goto-line l-num)))
