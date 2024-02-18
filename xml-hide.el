;;; xml-hide.el --- Hide XML tags in Emacs -*- lexical-binding: t; -*-

;; Author: Bruno Conte
;; Version: 1.0
;; Package-Requires: ((emacs "24.3"))

;;; Commentary:
;; A package to hide XML tags in Emacs.

(defgroup xml-hide nil
  "Hide XML tags in Emacs."
  :group 'text)

(defcustom xml-hide-replacement-string ""
  "String used to replace hidden XML tags."
  :type 'string
  :group 'xml-hide)

(defun hide-xml-tags ()
  "Hide all XML tags in the current buffer, displaying only the text contents."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "<[^<>]*>" nil t)
      (let ((mb (match-beginning 0))
            (me (match-end 0)))
        (put-text-property mb me 'read-only t)
        (let ((ov (make-overlay mb me)))
          (overlay-put ov 'xml-tag t)
          (overlay-put ov 'display (propertize " " 'invisible t 'intangible t))
          (overlay-put ov 'before-string xml-hide-replacement-string))))))

(defun xml-show-all ()
  "Show all hidden XML tags in the current buffer."
  (interactive)
  (let ((pos (point-min)))
    (while (< (setq pos (next-overlay-change pos)) (point-max))
      (dolist (ol (overlays-at pos))
        (if (overlay-get ol 'xml-tag)
            (delete-overlay ol)))))
  (remove-text-properties (point-min) (point-max) '(read-only t)))

;;;###autoload
(define-minor-mode xml-hide-mode
  "Toggle XML hide mode.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode."
  :lighter "XMLHide"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c h h") 'hide-xml-tags)
            (define-key map (kbd "C-c h s") 'xml-show-all)
            map)
  (if xml-hide-mode
      (hide-xml-tags)
    (show-all)))

(provide 'xml-hide)
