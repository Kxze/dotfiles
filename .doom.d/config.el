;; Usability stuff
(setq display-line-numbers-type 'relative)
(setq doom-font (font-spec :family "APL385 Unicode" :size 14 :weight 'light))
(setq doom-theme 'doom-opera-light)

;; Custom bindings
(map! :leader
      :prefix ("o" . "open")
       :when (featurep! :tools vterm)
       :desc "Terminal"          "T" #'+vterm/open
       :desc "Terminal in popup" "t" #'+vterm/open-popup-in-project)

;; Node executable path
(setq exec-path (append exec-path '("~/.nvm/versions/node/v10.15.3/bin")))

(after! company
  (setq company-idle-delay 0.4
        company-minimum-prefix-length 3))

(after! ox
  (require 'ox-hugo))

;; Rust stuff
(setq rust-format-on-save t)

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

;; Org capture templates
(after! org-capture
  (add-to-list 'org-capture-templates
               '("s" "Song" entry (file+headline "~/org/bookmarks.org" "Music")
                 "* TODO %x"))
  (add-to-list 'org-capture-templates
               '("t" "TODO" entry (file+headline "~/Documents/agenda.org" "Not filed")
                 "* TODO %x"))
  )

(add-hook 'org-babel-pre-tangle-hook
          (lambda () (org-macro-replace-all (org-macro--collect-macros))))

(defun org-tangle-without-saving ()
  (interactive)
  (cl-letf (((symbol-function 'save-buffer) #'ignore))
    (org-babel-tangle (buffer-file-name))
  )
  (undo-tree-undo))

(after! magit
  (setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     ")))

;; (set-face-attribute 'default nil :height 130)
(add-to-list 'exec-path "/home/rodrigo/.npm/bin")
(add-to-list 'exec-path "/usr/lib/elixir-ls")

;; Haskell
(setq lsp-haskell-process-path-hie "hie-wrapper")

;; Elixir
(setq lsp-clients-elixir-server-executable "elixir-ls")
(setq auth-sources '("~/.authinfo"))


(use-package! lsp-tailwindcss :init
              (setq! lsp-tailwindcss-add-on-mode t)
              (setq! lsp-tailwindcss-server-version "0.5.10")
              )

(setq-hook! 'js-mode-hook +format-with-lsp nil)