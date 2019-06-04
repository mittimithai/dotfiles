
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(autoload 'my-site-start "~/.emacs.d/site-start.d/my-site-start" nil t)
(my-site-start "~/.emacs.d/site-start.d/")

(require 'reftex)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1"))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(cperl-close-paren-offset 0)
 '(cperl-continued-statement-offset 0)
 '(cperl-extra-newline-before-brace t)
 '(cperl-extra-newline-before-brace-multiline t)
 '(cperl-indent-level 4)
 '(cperl-label-offset -4)
 '(cperl-merge-trailing-else nil)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(emacs-lisp-mode-hook (quote (turn-on-eldoc-mode checkdoc-minor-mode)))
 '(org-agenda-files (quote ("~/data/todo.org")))
 '(package-selected-packages
   (quote
    (solarized-theme auctex magit clj-refactor cider-decompile cider-eval-sexp-fu cider-hydra cider-spy cider clojure-mode ess)))
 '(save-place t nil (saveplace))
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(use-dialog-box nil)
 '(warning-suppress-types (quote ((undo discard-info)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




(put 'dired-find-alternate-file 'disabled nil)
