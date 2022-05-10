# dotfiles

These are just simple dotfiles for my Arch Linux installation.  They *should*
work on other distros, but your mileage may wary.  For zsh my plugins are
`grml-zsh-config`, `zsh-vi-mode` and `command-not-found` from `pkgfile`. For
vim it's only `vim-ranger`

# Installation

    cd $HOME
    git clone --bare https://github.com/da-kurlzzzzz/dotfiles
    git --git-dir=$HOME/dotfiles.git --work-tree=$HOME checkout --force
    source $HOME/.zshrc # reload shell and alias `dots' will be available
    dots config status.showUntrackedFiles no
    dots push --set-upstream origin main # because repo cloned as bare

<!-- vim:set tw=78: -->
