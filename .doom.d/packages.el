;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! ox-hugo)
(package! mpdel)
(package! ivy-mpdel)
(package! evil-numbers)
(package! org-gcal :recipe (:host github :repo "kidd/org-gcal.el"))
(package! company-statistics)
(package! eslintd-fix)
(package! company-tabnine)
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))