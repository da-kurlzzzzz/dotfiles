# got it from stackoverflow :)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    # && ! tmux info &> /dev/null
    [ -z "$VSCODE_PID" ] && exec tmux
fi

# main zsh feature
autoload -Uz compinit
compinit

# git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%F{green}%r (%b)%f'
precmd() { vcs_info }
setopt prompt_subst

# this is messy, as are all PS1s
PROMPT='%F{blue}%B%n%b%f@%m %2~ %# '
RPROMPT='$([ "$(git 2>/dev/null rev-parse --show-toplevel)" = "/home/$USER" ] || echo $vcs_info_msg_0_)%(?.. ret:%F{red}%B%?%b%f)$([ ! -z $RANGER_LEVEL ] && printf " R")'

# directory navigation

setopt auto_cd
setopt auto_pushd

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
ZLE_SPACE_SUFFIX_CHARS=$'|'
ZLE_REMOVE_SUFFIX_CHARS=$')'
zstyle ':completion:*' rehash true
zstyle ':completion:*:man:*:manuals' separate-sections true
zstyle ':completion:*:man:*:manuals.*' group-name ''
zstyle ':completion:*:man:*:descriptions' format '%d'

setopt globstarshort
setopt nocaseglob

# history
export HISTFILE=~/.zsh_history
setopt inc_append_history
setopt extended_history
setopt share_history
setopt hist_ignore_space
export SAVEHIST=$HISTSIZE

# plugins:

VIMODE_DIR="/usr/share/zsh/plugins/zsh-vi-mode"
test -d "$VIMODE_DIR" || VIMODE_DIR="${HOME}/.zsh-vi-mode"
VIMODE_FILE="$VIMODE_DIR/zsh-vi-mode.plugin.zsh"
ZVM_KEYTIMEOUT=0
ZVM_ESCAPE_KEYTIMEOUT=0
test -r $VIMODE_FILE && source $VIMODE_FILE
unset VIMODE_FILE

NOTFOUND_FILE="/usr/share/doc/pkgfile/command-not-found.zsh"
test -r $NOTFOUND_FILE && source $NOTFOUND_FILE
unset NOTFOUND_FILE
