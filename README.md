# dotfiles

These are just simple dotfiles for my Arch Linux installation.  They *should*
work on other distros, but your mileage may wary.  For zsh my plugins are
`grml-zsh-config`, `zsh-vi-mode` and `command-not-found` from `pkgfile`. For
vim it's only `vim-ranger`

# Installation

Run

    cd $HOME
    git init
    git remote add origin https://github.com/da-kurlzzzzz/dotfiles
    git fetch
    git checkout -t origin/main # optionally add -f to overwrite

<!-- vim:set tw=78: -->
