;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Set some padding to emacs window
(set-frame-parameter nil 'internal-border-width 6)

;; Turn off the menu bar and tool bar at the top of each frame because it's distracting
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Show line numbers except when in certain modes
(setq-default left-fringe-width  6)
(setq-default right-fringe-width  0)
(setq linum-format "\u2002%d")
(setq disabled-num-modes '(eshell-mode org-mode term-mode helm-mode magit-mode sbt-mode))

(add-hook 'focus-in-hook (lambda () (linum-mode
                                     (if (member major-mode disabled-num-modes) 0 1))))

;; Display line number in statusbar
(setq column-number-mode t)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

(load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'monokai t)
;; (load-theme 'zenburn t)
;; (load-theme 'white-sand t)

;; increase font size for better readability
(set-face-attribute 'default nil :font "Fira Mono 11")

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;; Modeline

;; Align and clears out borders and lines from mode-line
;; (setq x-use-underline-position-properties 1)
(setq underline-minimum-offset 10)
(set-face-attribute 'mode-line nil :box '(:line-width 2))
(set-face-attribute 'mode-line-inactive nil :box '(:line-width 2))

;; Window frame separator style
; (set-frame-parameter (selected-frame) 'right-divider-width 0)
; (set-face-background 'vertical-border "#eee8d5")
; (set-face-foreground 'vertical-border (face-background 'vertical-border)))

;;; Org
(setq org-src-fontify-natively t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;; Helm
(custom-set-faces
 '(helm-source-header ((t (:background "#fdf6e3" :foreground "#d33682" :weight extra-bold)))))
