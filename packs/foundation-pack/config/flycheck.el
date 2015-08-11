(require 'flycheck)

;;; Code:
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (flycheck-add-mode 'javascript-eslint 'web-mode)


(flycheck-define-checker javascript-eslint2
  ""
  :command ("npm" "run" "eslintOne" source)
  :error-parser flycheck-parse-checkstyle
  :error-filter (lambda (errors)
                  (mapc (lambda (err)
                          ;; Parse error ID from the error message
                          (setf (flycheck-error-message err)
                                (replace-regexp-in-string
                                 (rx " ("
                                     (group (one-or-more (not (any ")"))))
                                     ")" string-end)
                                 (lambda (s)
                                   (setf (flycheck-error-id err)
                                         (match-string 1 s))
                                   "")
                                 (flycheck-error-message err))))
                        (flycheck-sanitize-errors errors))
                  errors)
  :modes (js-mode js2-mode js3-mode web-mode)
  )

(add-to-list 'flycheck-checkers 'javascript-eslint2)

;; (flycheck-add-mode 'javascript-eslint2 'web-mode)

;; (global-set-key (kbd "C-c C-c") 'flycheck-compile)
(global-set-key "\C-cc" 'flycheck-compile)
