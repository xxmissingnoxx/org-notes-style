(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(message "package initialized")

(unless package-archive-contents
  (package-refresh-contents)
  (message "package refreshed"))

(package-install 'htmlize)
(message "htmlize installed")

(setq auto-save-default nil)
(setq make-backup-files nil)

(mapc (lambda (orgfile)
	(find-file orgfile)
	(message (org-html-export-to-html)))
      argv)
