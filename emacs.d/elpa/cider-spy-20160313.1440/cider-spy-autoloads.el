;;; cider-spy-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "cider-spy" "cider-spy.el" (0 0 0 0))
;;; Generated autoloads from cider-spy.el

(autoload 'cider-spy-nrepl-connected-hook "cider-spy" "\
This is called when an nREPL connection buffer is formed, and
   is executed with this buffer as the current buffer.

\(fn)" nil nil)

(autoload 'cider-spy-summary "cider-spy" "\
Create *cider-spy* buffer and attach listener.
   We assign a cider-spy-summary buffer to the nrepl-connection-buffer.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "cider-spy" '("cider-spy-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cider-spy-autoloads.el ends here
