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

# directory navigation

setopt auto_cd
setopt auto_pushd

DIRCOLORS="${HOME}/.dircolors"
test -r $DIRCOLORS && eval "$(dircolors $DIRCOLORS)"
unset DIRCOLORS

# all the nice things
source ~/.aliasrc
source ~/.envrc

_paste-with-xclip() {
    LBUFFER+="$(xclip -o 2>/dev/null)"
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

REPORTTIME=

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
