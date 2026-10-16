# GstarCAD Trim & Extend Tools

Trim many objects against one set of cutting edges, extend many objects to one boundary, or sweep a fence line through everything it crosses.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

The stock TRIM and EXTEND commands are one object at a time by default. These three commands let you set up the cutting edges or boundary once and then apply it to a whole selection, or draw a fence line and trim everything it crosses in a single pass.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/batch-trim.lsp` | ;; batch-trim.lsp - Trim many objects against one set of cutting edges
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
 |
| `scripts/batch-extend.lsp` | ;; batch-extend.lsp - Extend many objects to one set of boundary edges
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
 |
| `scripts/trim-fence.lsp` | ;; trim-fence.lsp - Draw a fence line and trim everything it crosses
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
