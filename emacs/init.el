;;; pre-load stuff
(setq evil-want-C-u-scroll t)

;;; packages 
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "e7f49a69d5fed5597d37b0711ca195fd632b9b08993194cb2f1d36dd1f7b20a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "2c613514f52fb56d34d00cc074fe6b5f4769b4b7f0cc12d22787808addcef12c" "c0a0c2f40c110b5b212eb4f2dad6ac9cac07eb70380631151fa75556b0100063" "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1" "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db" default))
 '(package-selected-packages
   '(org-autolist real-auto-save org org-bullets doom-themes zenburn-theme spacemacs-theme no-littering org-journal general smex magit fontawesome mood-line evil-commentary smart-mode-line which-key undo-tree counsel projectile evil))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "black" :foreground "#c3c0bb" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 151 :width normal :foundry "nil" :family "Menlo"))))
 '(org-document-title ((t (:foreground "#81A1C1" :weight bold :height 1.5))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil :height 1.25))))
 '(org-level-2 ((t (:inherit outline-2 :extend nil :height 1.1)))))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;; random settings
(setq vc-follow-symlinks nil)
;; (setq mouse-drag-copy-region t)
(setq void-text-area-pointer 'text)
(setq org-startup-folded nil)        ;;; org outline expanded
;; (setq org-blank-before-new-entry '((heading . t) (plain-list-item . auto)))        ;;; set blanks between headers on insert
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
(setq org-default-notes-file "~/Org/organizer.org")
(setq ring-bell-function 'ignore)
(which-key-mode)
(evil-commentary-mode)        ;;; gcc to comment lines in evil mode
(set-face-attribute 'default nil :family "Menlo" :height 150 :weight 'normal)
(menu-bar-showhide-tool-bar-menu-customize-disable)
(unless (display-graphic-p)
   (menu-bar-mode -1))
(savehist-mode 1)
(setq help-window-select t)

;;; evil
(evil-mode 1)

;;; no loitering
(require 'no-littering)



;;; define maps
(defvar my-leader-map (make-sparse-keymap) "Keymap for <leader> key")
(defvar my-org-map (make-sparse-keymap) "Keymap for my org files")

;;; define leader key
(define-key evil-normal-state-map (kbd "SPC") my-leader-map)

;;; define leader key bindings
(define-key my-leader-map "i" (defun open-init () (interactive) (find-file user-init-file)))
(define-key my-leader-map "o" my-org-map)
(define-key my-leader-map (kbd "SPC") (defun prev-buffer () (interactive) (switch-to-buffer (other-buffer (current-buffer) 1))))
(define-key my-leader-map "." 'find-file)
(define-key my-leader-map "," 'switch-to-buffer)
(define-key my-leader-map "k" 'kill-buffer)
(define-key my-leader-map "p" 'projectile-command-map)
(define-key my-leader-map "g" 'magit-dispatch)
(define-key my-leader-map "o" my-org-map)

;;; define my custom org key map
(define-key my-org-map "o" (defun find-in-org-dir () (interactive) (counsel-find-file "~/Org/")))
(define-key my-org-map "z" (defun go-to-organizer () (interactive) (find-file "~/Org/organizer.org")))
;; (define-key my-org-map "n" 'org-journal-new-entry)
(define-key my-org-map "j" 'org-journal-new-entry)
(define-key my-org-map "t" (lambda () (interactive) (org-journal-new-entry t)))

;;; random key bindings
(define-key evil-insert-state-map "\C-g" 'evil-normal-state)
(setq org-M-RET-may-split-line '((default . nil)))

;;; org journal settings
(setq org-journal-find-file #'find-file)
(setq org-journal-file-format "%Y-%m-%d")
(setq org-journal-date-prefix "#+TITLE: ")
(setq org-journal-date-format (concat "%A, %B %d %Y\n"
				      ;; "#+STARTUP: showall\n"
                                      "\n"
				      "* Tasks\n"))
(setq org-journal-time-prefix "** ")
(setq org-journal-time-format "")
(setq org-journal-hide-entries-p nil)
(setq org-journal-dir "~/Org/journal/")
(require 'org-journal)

;;; undo
(require 'undo-tree)
(global-undo-tree-mode)
(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)
(define-key evil-normal-state-map (kbd "u") 'undo-tree-undo)
;; (setq evil-undo-system "undo-redo")
(setq evil-want-fine-undo t)

;;; projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/Projects"))
(setq projectile-switch-project-action 'projectile-dired)
(projectile-mode +1)

;;; themes 

;; Tell Emacs where is your personal theme directory
(add-to-list 'custom-theme-load-path (expand-file-name "themes"
                                                       user-emacs-directory))
(setq custom-theme-directory "~/.emacs.d/themes")
;; (load-theme 'spacemacs-dark t) ; bleh
;; (load-theme 'zenburn t) ; bleh
;; (load-theme 'doom-one t) ; awesome 
(load-theme 'doom-nord t) ; less awesome but still awesome
;; (load-theme 'doom-one-light t) 
;; (set-background-color BLACK)

;;; ivy
(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-initial-inputs-alist nil)

;;; fix mac cmd-v cmd-p copy/paste
(require 'simpleclip)
(simpleclip-mode 1)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;;; mood line
(mood-line-mode)

;;; visual stuff
(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode'(("^ +\\([-*]\\) " (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;; auto save
(require 'real-auto-save)
(setq real-auto-save-interval 5)
(add-hook 'org-mode-hook 'real-auto-save-mode)

;;; todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "WAITING" "|" "DONE")))
(setq org-todo-keyword-faces
  '(("IN PROGRESS" . "orange")))

;;; zoom
(global-set-key (kbd "s-=") (lambda () (interactive) (text-scale-increase 0.3)))        ;;; set cmd +/- to resize text  
(global-set-key (kbd "s--") (lambda () (interactive) (text-scale-decrease 0.3)))

;;; close with cmd-w, cmd-q 
(global-set-key (kbd "s-w") 'evil-window-delete)
(global-set-key (kbd "s-q") 'evil-quit)

;;; org auto list
(add-hook 'org-mode-hook (lambda () (org-autolist-mode)))

;;; fringe
(fringe-mode 0)

;;; org stuff?
(setq org-agenda-files '("~/Org"))

;;; show parens
(show-paren-mode 1)
