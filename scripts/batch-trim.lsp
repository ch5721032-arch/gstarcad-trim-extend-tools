;; batch-trim.lsp - Trim many objects against one set of cutting edges
;; Command: BTRIM
(defun c:BTRIM ( / ssb sso )
  (setq ssb (ssget "\nSelect cutting edges: "))
  (if ssb
    (progn
      (setq sso (ssget "\nSelect objects to trim: "))
      (if sso
        (command "_.TRIM" ssb "" sso "")
      )
    )
  )
  (princ)
)
