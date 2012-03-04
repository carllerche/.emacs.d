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

;; Require vendored plugins
(require 'lusty-explorer)
(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-x C-b") 'lusty-buffer-explorer)

;; No auth save files kthx
(setq auto-save-mode nil)

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; My custom font
(set-frame-font "Inconsolata-13")
