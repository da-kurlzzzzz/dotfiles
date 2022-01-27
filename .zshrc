if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

zstyle ':prompt:grml:left:items:path' token '%2~ '

alias ll='ls --group-directories-first -ohA'
alias watch='watch '
alias xclip='xclip -rmlastnl -selection clipboard'
alias dots='/usr/bin/git --git-dir=/mnt/slow/dotfiles.git --work-tree=$HOME'

eval "$(dircolors ${HOME}/.dircolors)"

PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

export MANPAGER="vim +MANPAGER -c 'setlocal nonumber' -"

setopt globstarshort
setopt nullglob

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
