;; batch-extend.lsp - Extend many objects to one set of boundary edges
;; Command: BEXT
(defun c:BEXT ( / ssb sso )
  (setq ssb (ssget "\nSelect boundary edges: "))
  (if ssb
    (progn
      (setq sso (ssget "\nSelect objects to extend: "))
      (if sso
        (command "_.EXTEND" ssb "" sso "")
      )
    )
  )
  (princ)
)
