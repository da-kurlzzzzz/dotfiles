# got it from stackoverflow :)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    # && ! tmux info &> /dev/null
    # echo started tmux "PS1 = $PS1" "TERM = $TERM" "TMUX = $TMUX" >> ~/tmux-war/tmux-logs
    exec tmux
fi

# all hail grml-zsh-config
# and this line is a PS1 change for my taste
# it shows not all current path, but only last 2 components
zstyle ':prompt:grml:left:items:path' token '%2~ '

alias ll='ls --group-directories-first -lhA'
# auto cd to ranger directory
alias r='. ranger'
# this is just to be able to
# $ watch ll
alias watch='watch '
alias xclip='xclip -rmlastnl -selection clipboard'
alias pip_upgrade='pip list --outdated --format=json | jq -r ".[] | .name" | xargs pip install -U'
alias uu='udiskie-umount -fd'
alias sudo='sudo '
alias sc='systemctl'
alias blc='bluetoothctl'
alias feh='feh -.'
alias trr='transmission-remote'
alias trans='bash /usr/bin/trans'
alias your-students='task recurring +students recur:weekly parent: rc.dateformat:a-H:N'
alias your-pending='task li -myself'
alias note='$EDITOR $(date +%F)-notes.md'

DIRCOLORS="${HOME}/.dircolors"
test -r $DIRCOLORS && eval "$(dircolors $DIRCOLORS)"
unset DIRCOLORS

# my binaries and python local files
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# refer to vim :help manpager.vim
export MANPAGER="vim --not-a-term +MANPAGER -c 'setlocal nonumber' -"

setopt globstarshort

VIMODE_FILE="/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
ZVM_KEYTIMEOUT=0
ZVM_ESCAPE_KEYTIMEOUT=0
test -r $VIMODE_FILE && source $VIMODE_FILE
unset VIMODE_FILE

NOTFOUND_FILE="/usr/share/doc/pkgfile/command-not-found.zsh"
test -r $NOTFOUND_FILE && source $NOTFOUND_FILE
unset NOTFOUND_FILE

export HISTSIZE=5000000

_paste-with-xclip() {
    LBUFFER+="$(xclip -o)"
}

zle -N _paste-with-xclip
bindkey -v '^v' _paste-with-xclip
