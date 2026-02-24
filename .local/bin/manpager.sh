#!/usr/bin/env bash
set -euo pipefail

vim \
--not-a-term \
+MANPAGER \
-c 'setlocal nonumber' \
-c 'setlocal modifiable noreadonly' \
-c 'silent! %s/\e]8;;[^\e]*\e\\//g' \
-c 'setlocal nomodifiable readonly' \
-c 'nnoremap q :q<CR>' \
-c 'norm gg' \
-
