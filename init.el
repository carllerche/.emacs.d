(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(defvar my-packages
  '(starter-kit
    starter-kit-lisp
    starter-kit-bindings
    clojure-mode
    clojure-test-mode))

;; Install the listed packages

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Add vendored plugins to load path
(setq load-path (cons "~/.emacs.d/vendor/lusty-emacs" load-path))
(setq load-path (cons "~/.emacs.d/vendor/auto-complete" load-path))

;; Require vendored plugins
(require 'lusty-explorer)
(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-x C-b") 'lusty-buffer-explorer)

(require 'auto-complete-config)
(when (featurep 'auto-complete)
  (ac-config-default)
  (setq ac-auto-start nil)
  (setq ac-quick-help-delay 0.5)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/ac-dict")
  ;; Store the completion history in the cache directory
  (setq ac-comphist-file "~/.emacs.cache/ac-comphist.data")

  (add-hook 'auto-complete-mode-hook 'ac-common-setup)

  ;; Enable auto-complete globally
  (global-auto-complete-mode t))

;; No auth save files kthx
(setq auto-save-mode nil)

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; Tweak scrolling
(setq scroll-step 1 scroll-conservatively 10000)

;; My custom font
(set-frame-font "Inconsolata-13")
