(let ((base (concat dotfiles-dir "/extra-packages")))
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "/extra-packages/auto-complete/ac-dict"))
(ac-config-default)

(provide 'extra-packages)
