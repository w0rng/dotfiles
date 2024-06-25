;; (setq scroll-margin 1
;;   scroll-step 1
;;   ;; scroll-conservatively 100000
;;   scroll-preserve-screen-position 1
;;   mouse-wheel-progressive-speed nil
;;   mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; (require 'fast-scroll)
;; (add-hook 'fast-scroll-start-hook (lambda () (flycheck-mode -1)))
;; (add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode 1)))
;; (fast-scroll-config)
;; (fast-scroll-mode 1)

(if (>= emacs-major-version 29)
  (pixel-scroll-precision-mode 1)
    (setq pixel-scroll-precision-large-scroll-height 40.0))

(tool-bar-mode 1)
(tool-bar-mode 0)

(setq display-line-numbers-type nil)

(setq-default cursor-type '(bar . 2))

(setq mouse-wheel-tilt-scroll t
      mouse-wheel-flip-direction t)

(setq cwm-centered-window-width 110)
(centered-window-mode t)

(after! doom-modeline
  (setq mode-line-right-align-edge 'right-fringe))

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 14 :weight 'normal))
(add-hook! 'prog-mode-hook
  (setq-local default-text-properties '(line-spacing 0.2 line-height 1.3)))

(custom-set-faces!
  '(flycheck-error :background "#FFE0E0" :underline nil))

(after! doom-themes
  (setq doom-themes-enable-bold nil))

(plist-put! +ligatures-extra-symbols
  :name          "»"
  :src_block     "»"
  :src_block_end "«"
  :quote         "“"
  :quote_end     "”"
  :lambda        "λ"
  :def           "ƒ"
  :composition   "∘"
  :map           "↦"
  :null          "∅"
  :true          nil
  :false         nil
  :int           "ℤ"
  :float         "ℝ"
  :str           nil
  :bool          "𝔹"
  :list          nil
  :not           "￢"
  :in            "∈"
  :not-in        "∉"
  :and           "∧"
  :or            "∨"
  :for           "∀"
  :some          "∃"
  :return        ""
  :yield         ""
  :union         "⋃"
  :intersect     "∩"
  :diff          "∖"
  :tuple         "⨂"
  :pipe          ""
  :dot           "•")

(setq doom-theme 'doom-alabaster)

(require 'vertico-posframe)
(vertico-posframe-mode 1)
(setq vertico-posframe-parameters
      '((left-fringe . 16)
        (right-fringe . 16)))

(setq auto-save-default t
      make-backup-files t)

(map! "s-<backspace>" #'kill-whole-line)

(map! "s-w" #'kill-this-buffer)

(map! "s-1" #'treemacs)

(map! "s-3" #'+vterm/toggle)

(map! "s-F" #'+vertico/project-search)

(map! "s-d" #'duplicate-line)

(map! "s-8" #'docker-containers)

(global-origami-mode)
(map! "s-." #'origami-toggle-node)

(map! "s-<mouse-1>" #'lsp-goto-type-definition)

(map! "M-[" #'pop-global-mark)

(custom-set-faces
 '(org-document-title ((t (:inherit outline-1 :height 2.0))))
  '(org-level-1 ((t (:inherit outline-1 :height 1.75))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.25))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1)))))

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

(after! (treemacs projectile)
  (treemacs-project-follow-mode 1))

(setq lsp-lens-enable t)

(setq lsp-ui-doc-show-with-cursor t)



(setq user-full-name "w0rng"
      user-mail-address "me@w0rng.ru")
