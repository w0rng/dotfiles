;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! treemacs-projectile)
(package! centered-window)
(package! pretty-mode)
(package! vertico-posframe)
(package! origami)

(package! doom-alabaster-theme :recipe
  (:host github
   :repo "agraul/doom-alabaster-theme"))

(package! good-scroll :recipe
  (:host github
   :repo "io12/good-scroll.el"
   :files ("*.el")))


(package! fast-scroll :recipe
  (:host github
   :repo "ahungry/fast-scroll"
   :files ("*.el")))
