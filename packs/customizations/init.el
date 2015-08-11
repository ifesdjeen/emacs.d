;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
(live-load-config-file "smex.el")
(live-load-config-file "ido.el")
(live-load-config-file "textmate.el")

;;
;; Tabbar
;;

(require 'tabbar)

(custom-set-variables
 '(tabbar-background-color "black")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-scroll-left-button (quote ((" <") " =")))
 '(tabbar-scroll-right-button (quote ((" >") " =")))
 '(tabbar-separator (quote ("  |  ")))
 '(tabbar-use-images nil))

(require 'magit-blame)
(require 'quick-jump)


;; (require 'hs-lint)

;; (setq flymake-gui-warnings-enabled nil)





;;
;; Company Mode
;;

(require 'helm-config)

(helm-mode 1)

(global-set-key (kbd "C-x C-b")   'helm-buffers-list)
(global-set-key (kbd "M-/")       'helm-dabbrev)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; (delete 'company-semantic company-backends)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-gtags)
(add-to-list 'company-backends 'company-files)
(add-to-list 'company-backends 'company-etags)
(add-to-list 'company-backends 'company-clang)
(add-to-list 'company-backends 'company-dabbrev)
(add-to-list 'company-backends 'company-dabbrev-code)

(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (global-set-key [tab] 'company-complete)

(require 'projectile)
(projectile-global-mode)

(require 'helm-projectile)
(helm-projectile-on)


(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))



;;
;; Ecmascript mode
;;
(live-add-pack-lib "/less-mode/")
(require 'less-mode)

(setq auto-mode-alist (append '(("\\.less$" . less-mode))
                              auto-mode-alist))



(require 'golden-ratio)

(golden-ratio-mode 1)


(require 'web-mode)
(setq web-mode-content-types-alist '(("jsx"  . "\\.es6?\\'")))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . web-mode))

(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
