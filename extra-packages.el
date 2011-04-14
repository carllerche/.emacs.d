(let ((base (concat dotfiles-dir "/extra-packages")))
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; Setting up auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "/extra-packages/auto-complete/ac-dict"))
(ac-config-default)

;; Setting up ac-slime
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(provide 'extra-packages)

;; Require clojure-mode
(require 'clojure-mode)
(require 'clojure-test-mode)

;; Require align-cljlet
(require 'align-cljlet)
