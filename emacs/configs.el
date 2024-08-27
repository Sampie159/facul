;;; configs --- A bunch of configs
;;; Commentary:
;;; No idea why it's in this file but ok

;;; Code:

(setq eshell-rc-script (concat user-emacs-directory "eshell/profile")
      eshell-aliases-file (concat user-emacs-directory "eshell/aliases")
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh"))

;; C/C++ and alike languages
(setq c-default-style "linux"
      c-basic-offset 4)

(add-hook 'c-ts-mode-hook
    (lambda ()
      (local-set-key (kbd "C-c o") 'ff-find-other-file)))

(setq backup-directory-alist '((".*" . "~/.trash")))
(setq lsp-clients-clangd-args
      '("-j=16"
		"--compile-commands-dir=./debug"
        "--background-index"
        "--completion-style=bundled"
        "--pch-storage=memory"
        "--header-insertion=never"
        "--header-insertion-decorators=0"))

(require 'org-tempo)
(org-babel-do-load-languages
 'org-babel-load-languages ' ((C . t)))

(icomplete-mode 1)

(add-hook 'c++-mode-hook #'(lambda () (c-set-offset 'innamespace [0])))

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme '4coder)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
	(define-key map (kbd "C-x b") 'counsel-switch-buffer)
	map)
  "Defines the my-keys-minor-mode keymaps.")

(define-minor-mode my-keys-minor-mode
  "Redefining some keys."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)

(setq display-buffer-alist
	  '(("\\*compilation\\*"
		 (display-buffer-reuse-window
		  display-buffer-below-selected)
		 (window-height . 15)
		 (dedicated . t)
		 (body-function . (lambda (window) (select-window window))))))

(defun header-guard ()
  "Add header guard to new C/C++ header files."
  (when (and (buffer-file-name)
             (string-match "\\.\\(h\\|hh\\|hpp\\)\\'" (buffer-file-name))
             (zerop (buffer-size)))
    (let* ((filename (file-name-nondirectory (buffer-file-name)))
           (extension (concat "_" (upcase (file-name-extension filename)) "__"))
           (guard (concat "__" (upcase (file-name-sans-extension filename)) extension)))
      (insert "#ifndef " guard "\n#define " guard "\n\n")
      (insert "\n\n#endif /* " guard " */\n")
      (goto-char (point-min))
      (forward-line 3))))

(add-hook 'c-mode-common-hook 'header-guard)

(defun label (label)
  (interactive "sLABEL: ")
  (insert "/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */\n")
  (insert (concat "/*" (store-substring (make-string 75 ?\s) (/ (- 75 (length label)) 2) (upcase label))) "*/\n")
  (insert "/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */\n"))

(defun insert-if0-block ()
  "Inserts a #if 0 ... #endif block around the current function."
  (interactive)
  (let (begin end)
    (if (use-region-p)
        (setq begin (region-beginning)
              end (region-end))
      (setq begin (progn (beginning-of-defun) (point))
            end (progn (end-of-defun) (point))))
    (save-excursion
      (goto-char end)
      (if (use-region-p)
          (progn
            (end-of-line)
            (newline)
            (insert "#endif"))
        (insert "#endif\n"))
      (goto-char begin)
      (if (use-region-p)
          (progn
            (beginning-of-line)
            (newline)
            (previous-line)
            (insert "#if 0\n"))
        (insert "#if 0\n")))))

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'inextern-lang 0)
            (c-set-offset 'innamespace 0)
            (define-key c-mode-map (kbd "C-c 0") 'insert-if0-block)))

;;; configs.el ends here
