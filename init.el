;; require package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;; init packages
(package-initialize)

;; define installed packages
(defvar my-packages '(better-defaults
                      clojure-mode
                      clj-refactor
                      idle-highlight-mode
                      cider
                      paredit
                      auto-complete
                      rainbow-delimiters
                      js2-mode))

;; install packages if not installed
(dolist (package my-packages)
  (when (not (package-installed-p package))
    (package-install package)))

;; set hooks
(require 'clj-refactor)

;; paredit js
(add-hook 'js-mode-hook 'my-paredit-nonlisp)
(add-hook 'js-mode-hook 'esk-paredit-nonlisp)

;; lisp
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))

;; js2-mode hooks
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; default settings
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq js-indent-level 2)
(setq js2-highlight-level 3) ;; js2-mode

;; define keys
; (define-key js-mode-map "{" 'paredit-open-curly)
; (define-key js-mode-map "}" 'paredit-close-curly-and-newline)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile js2-mode rainbow-delimiters auto-complete idle-highlight-mode clj-refactor clojure-mode better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(projectile-mode)
