# got it from stackoverflow :)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

# all hail grml-zsh-config
# and this line is a PS1 change for my taste
# it shows not all current path, but only last 2 components
zstyle ':prompt:grml:left:items:path' token '%2~ '

alias ll='ls --group-directories-first -ohA'
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

DIRCOLORS="${HOME}/.dircolors"
test -r $DIRCOLORS && eval "$(dircolors $DIRCOLORS)"
unset DIRCOLORS

# my binaries and python local files
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# refer to vim :help manpager.vim
export MANPAGER="vim --not-a-term +MANPAGER -c 'setlocal nonumber' -"

setopt globstarshort
setopt nullglob

VIMODE_FILE="/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
ZVM_KEYTIMEOUT=0
ZVM_ESCAPE_KEYTIMEOUT=0
test -r $VIMODE_FILE && source $VIMODE_FILE
unset VIMODE_FILE

NOTFOUND_FILE="/usr/share/doc/pkgfile/command-not-found.zsh"
test -r $NOTFOUND_FILE && source $NOTFOUND_FILE
unset NOTFOUND_FILE

# xdg-ninja stuff
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
test -d $(dirname $HISTFILE) || mkdir -p $(dirname $HISTFILE)
