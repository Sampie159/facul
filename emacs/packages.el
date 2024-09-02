;;; package --- use-packages
;;; Commentary:
;;; Code:

(use-package seq :ensure t)

(use-package ripgrep :ensure t)

(use-package transient :ensure t)

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status))

(use-package cmake-mode
  :ensure t
  :config
  (setq cmake-tab-width 4)
  :hook ((cmake-mode . lsp)))

(use-package racket-mode
  :ensure t
  :hook ((racket-mode . lsp)))

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
		which-key-sort-order #'which-key-key-order-alpha
		which-key-sort-uppercase-first nil
		which-key-add-column-padding 1
		which-key-max-display-columns nil
		which-key-min-display-lines 6
		which-key-side-window-slot -10
		which-key-side-window-max-height 0.25
		which-key-idle-delay 0.8
		which-key-max-description-length 25
		which-key-allow-imprecise-window-fit t
		which-key-separator " -> "))

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t
		enable-recursive-minibuffers t)
  (ivy-mode))

(use-package counsel
  :ensure t
  :config (counsel-mode))

(use-package swiper
  :ensure t
  :after ivy
  :config
  (global-set-key (kbd "C-s") 'swiper))

(use-package eshell-syntax-highlighting
  :ensure t
  :after esh-moe
  :config (eshell-syntax-highlighting-global-mode +1))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-enable-suggest-server-download nil)
  :hook
  ((c-mode . lsp)
   (c++-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :config
  (define-key lsp-mode-map (kbd "C-c l f") #'lsp-format-buffer)
  (setq lsp-enable-on-type-formatting nil
        lsp-enable-snippet nil
        lsp-inlay-hint-enable nil
        lsp-diagnostics-provider :none
        lsp-diagnostic-package :none)
  :commands (lsp))

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package hl-todo
  :ensure t
  :config
  (setq hl-todo-highlight-punctuation ":"
		hl-todo-keyword-faces
		'(("TODO" . "#E6E600")
		  ("DEBUG" . "#A020F0")
		  ("FIXME" . "#FF0000")
		  ("NOTE" . "#FF4500")
		  ("DEPRECATED" . "#1E90FF")))
  (global-hl-todo-mode t))

(use-package dired-open
  :ensure t
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("png" . "sxiv")
                                ("mov" . "mpv")
                                ("webm" . "mpv")
                                ("mkv" . "mpv")
                                ("mp4" . "mpv"))))

(use-package toc-org
  :ensure t
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package smart-tab
  :ensure t
  :config (global-smart-tab-mode 1))

(use-package projectile
  :ensure t
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/projects/" "~/playgrounds/" "~/faculdade/"))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-\"") 'mc/skip-to-next-like-this)
  (global-set-key (kbd "C-:") 'mc/skip-to-previous-like-this))

(use-package highlight-numbers
  :ensure t
  :hook ((prog-mode . highlight-numbers-mode)))

(use-package corfu
  :ensure t
  :init (global-corfu-mode))

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (read-extended-command-predicate #'command-completion-default-include-p))

;;; Packages.el ends here
