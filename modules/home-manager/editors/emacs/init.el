;; ui

(setq inhibit-startup-screen t
      initial-scratch-message nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(global-display-line-numbers-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)
(blink-cursor-mode -1)
(setq display-line-numbers-width 3)

;; edit mode
(setq-default indent-tabs-mode nil
	          tab-width 4)
(delete-selection-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; scrolling
(setq scroll-margin 3
      scroll-conservatively 101
      mouse-wheel-scroll-amount '(2)
      mouse-wheel-progressive-speed nil)

;; files and backups
(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

;; misc
(setq ring-bell-function 'ignore
      use-short-answers t)
(recentf-mode 1)
(setq recentf-max-saved-items 50)
(save-place-mode 1)
(savehist-mode 1)

;; encoding
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; evil
(setq evil-want-keybinding nil)

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(global-set-key (kbd "<escape>") #'keyboard-escape-quit)

(evil-set-initial-state 'messages-buffer-mode 'normal)
(evil-set-initial-state 'dashboard-mode 'normal)

;; theming
(load-theme 'adwaita-dark t)

;; completion
(use-package vertico
  :custom
  (vertico-count 12)
  (vertico-cycle t)
  (vertico-resize nil)
  :config
  (vertico-mode))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

;; bindings
(use-package which-key
  :custom
  (which-key-idle-delay 0.3)
  (which-key-min-display-lines 6)
  :config
  (which-key-mode))

(use-package general
  :after evil
  :demand t)

(general-create-definer amraleth-leader
  :states '(normal visual)
  :keymaps 'override
  :prefix "SPC"
  :global-prefix "C-SPC")

(amraleth-leader
  "TAB" '(dired-jump :wk "dired")

  ;; files
  "f"   '(:ignore t :wk "files")
  "ff"  '(find-file :wk "find file")
  "fr"  '(recentf-open-files :wk "recent files")
  "fs"  '(save-buffer :wk "save file")

  ;; buffer
  "b"   '(:ignore t :wk "buffer")
  "bb"  '(switch-to-buffer :wk "switch buffer")
  "bc"  '(kill-current-buffer :wk "close current buffer")
  "bn"  '(next-buffer :wk "next buffer")
  "bp"  '(previous-buffer :wk "previous buffer")
  "bi"  '(ibuffer :wk "ibuffer")

  ;; window
  "w"   '(:ignore t :wk "window")
  "wv"  '(evil-window-vsplit :wk "vertical split")
  "ws"  '(evil-window-split :wk "horizontal split")
  "wc"  '(evil-window-delete :wk "close window")
  "wh"  '(evil-window-left :wk "go left")
  "wj"  '(evil-window-down :wk "go down")
  "wk"  '(evil-window-up :wk "go up")
  "wl"  '(evil-window-right :wk "go right")
  "w="  '(balance-windows :wk "balance")
  "ww"  '(evil-window-next :wk "next window")

  ;; help
  "h"   '(:ignore t :wk "help")
  "hf"  '(describe-function :wk "describe function")
  "hv"  '(describe-variable :wk "describe variable")
  "hk"  '(describe-key :wk "describe key")
  "hm"  '(describe-mode :wk "describe mode")

  ;; toggle
  "t"   '(:ignore t :wk "toggle")
  "tl"  '(display-line-numbers-mode :wk "line numbers")
  "tw"  '(visual-line-mode :wk "word wrap")

  ;; align
  "a"   '(:ignore t :wk "align")
  "aa"  '(align :wk "align")
  "ar"  '(align-regexp :wk "align regexp"))

;; magit
(use-package magit
  :general
  (amraleth-leader
    "g" '(:ignore t :wk "git")
    "gs" '(magit-status :wk "status")
    "gb" '(magit-blame-date :wk "blame")
    "gl" '(magit-log-current :wk "log")
    "gd" '(magit-diff-dwim :wk "diff")
    "gf" '(magit-file-dispatch :wk "file actions")))

;; diff
(use-package diff-hl
  :demand t
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  :hook
  ((magit-post-refresh . diff-hl-magit-post-refresh)
   (magit-pre-refresh . diff-hl-magit-pre-refresh)
   (dired-mode . diff-hl-dired-mode)))

;; nix mode
(use-package nix-mode
  :mode "\\.nix\\'"
  :hook ((nix-mode . eglot-ensure)
         (nix-mode . (lambda ()
                       (add-hook 'before-save-hook
                                 #'eglot-format-buffer
                                 nil t)))))
