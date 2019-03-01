
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
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(emacs-lisp-mode-hook (quote (turn-on-eldoc-mode checkdoc-minor-mode)))
 '(org-agenda-files (quote ("~/data/todo.org")))
 '(package-selected-packages
   (quote
    (clj-refactor cider-decompile cider-eval-sexp-fu cider-hydra cider-spy cider clojure-mode ess)))
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
