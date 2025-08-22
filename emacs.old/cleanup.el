;;; This is to do some cleanup

(defun aqez/get-line-string ()
  "Gets the current line in the buffer as a string"
  (buffer-substring-no-properties
   (line-beginning-position)
   (line-end-position)))

(defun aqez/current-line-empty-p ()
  "Determines if the current line at point is empty"
  (string-match-p "\\`\\s-*$" (aqez/get-line-string)))

(defun aqez/remove-duplicate-blank-lines ()
  "Replace multiple blank lines with a single one and then go back to the
   initial point"
  (let ((initial-point (point)))
    (goto-char (point-min))
    (while (not (eobp))
      (if (aqez/current-line-empty-p)
          (progn
            (forward-char 1)
            (while (and (not (eobp)) (aqez/current-line-empty-p))
              (kill-whole-line)))
        (forward-char 1)))
    (goto-char initial-point)))

(defun aqez/remove-blank-lines-near-curly-braces ()
  "Remove blank lines that immediately folow a line ending with an opening curly
   brace or blank lines that are immediately followed by a closing curly brace."
  (let ((initial-point (point)))
    (print "moving to beginning")
    (goto-char (point-min))
    (while (not (eobp))
      (cond ((string-match-p "{$" (aqez/get-line-string))
             (forward-line 1)
             (while (and (not (eobp)) (aqez/current-line-empty-p))
               (kill-whole-line)))
            ((string-match-p "\\`\\s-*}$" (aqez/get-line-string))
             (forward-line -1)
             (if (aqez/current-line-empty-p)
                 (progn
                   (kill-whole-line)
                   (forward-line -1))
               (forward-line 1))))
      (forward-line 1))
    (goto-char initial-point)))

(defun aqez/format-buffer ()
  "Format the current buffer."
  (interactive)
  (if (bound-and-true-p lsp-mode)
      (lsp-format-buffer)
    (indent-region (point-min) (point-max))))

(defun aqez/file-cleanup ()
  (interactive)
  (when (derived-mode-p 'prog-mode)
    "Clean up the file by removing unnecessary spaces and formatting it"
    (aqez/remove-duplicate-blank-lines)
    (aqez/remove-blank-lines-near-curly-braces)
    (aqez/format-buffer)))
