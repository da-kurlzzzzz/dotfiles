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

Transmission saves hashed password in its config file. Even though the
password is for local access only, I decided to remove it with git filters.
For security reasons I can't distribute needed filter in ready to use form.
Instead after running transmission for the first time add the following to
`.git/config`


    [filter "removePassword"]
        clean = .helpers/clean.sh
        smudge = .helpers/smudge.sh
        required = true

Or run the following

    git config filter.removePassword.clean .helpers/clean.sh
    git config filter.removePassword.smudge .helpers/smudge.sh
    git config filter.removePassword.required true

<!-- vim:set tw=78: -->
