;; trim-fence.lsp - Draw a fence line and trim everything it crosses
;; Command: TFENCE
(defun c:TFENCE ( / p1 p2 )
  (setq p1 (getpoint "\nFirst fence point: "))
  (if p1
    (progn
      (setq p2 (getpoint p1 "\nSecond fence point: "))
      (if p2
        (command "_.TRIM" "" "_F" p1 p2 "" "")
      )
    )
  )
  (princ)
)
