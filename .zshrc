# got it from stackoverflow :)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    # && ! tmux info &> /dev/null
    exec tmux
fi

# main zsh feature
autoload -Uz compinit
compinit

# git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%F{green}%r%f'
precmd() { vcs_info }
setopt prompt_subst

# this is messy, as are all PS1s
PROMPT='%F{blue}%B%n%b%f@%m %2~ %# '
RPROMPT='${vcs_info_msg_0_}%(?.. ret:%F{red}%B%?%b%f)$([ ! -z $RANGER_LEVEL ] && printf " R")'

# for everything
export EDITOR=vim

# directory navigation
alias ls='ls --color'
alias l='ls -l'
alias ll='ls --group-directories-first -lhA'
alias ...=../..

setopt auto_cd
setopt auto_pushd

DIRCOLORS="${HOME}/.dircolors"
test -r $DIRCOLORS && eval "$(dircolors $DIRCOLORS)"
unset DIRCOLORS

# auto cd to ranger directory
_run-ranger() {
    [ -z $RANGER_LEVEL ] && . ranger || exit
}
alias r=_run-ranger

_paste-with-xclip() {
    LBUFFER+="$(xclip -o)"
}
zle -N _paste-with-xclip
bindkey -v '^v' _paste-with-xclip

_fg-ctrl-z() {
    zle push-input
    BUFFER=" fg"
    zle accept-line
}
zle -N _fg-ctrl-z
bindkey '^z' _fg-ctrl-z

_mkcd() {
    mkdir "$1" && cd "$1"
}

alias mkcd='_mkcd'

REPORTTIME=

# this is just to be able to
# $ watch <aliased command>
# $ sudo <aliased command>
alias watch='watch '
alias sudo='sudo '

# minor aliases just for me
alias xclip='xclip -rmlastnl -selection clipboard'
alias uu='sync && udiskie-umount -fd'
alias sc='systemctl'
alias blc='bluetoothctl'
alias feh='feh -.'
alias trr='transmission-remote'
alias trans='bash /usr/bin/trans'
alias your-students='task recurring +students recur:weekly parent: rc.dateformat:a-H:N'
alias your-pending='task li -myself'
alias note='$EDITOR $(date +%F)-notes.md'

# my binaries and python local files
export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# refer to vim :help manpager.vim
export MANPAGER="vim --not-a-term +MANPAGER -c 'setlocal nonumber' -"

setopt globstarshort
setopt nocaseglob

# history
export HISTFILE=~/.zsh_history
setopt inc_append_history
setopt extended_history
setopt share_history
setopt hist_ignore_space
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

# plugins:

VIMODE_FILE="/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
ZVM_KEYTIMEOUT=0
ZVM_ESCAPE_KEYTIMEOUT=0
test -r $VIMODE_FILE && source $VIMODE_FILE
unset VIMODE_FILE

NOTFOUND_FILE="/usr/share/doc/pkgfile/command-not-found.zsh"
test -r $NOTFOUND_FILE && source $NOTFOUND_FILE
unset NOTFOUND_FILE
