(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(defvar my-packages 
  '(starter-kit
    starter-kit-lisp
    starter-kit-bindings
    clojure-mode
    clojure-test-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(set-frame-font "Inconsolata-13")
