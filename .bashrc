PS1='\[\e[1;34m\]\u\[\e[0m\]@\h \w % '
PROMPT_DIRTRIM=2
export EDITOR=vim
export PROMPT_COMMAND="[ -z $RANGER_LEVEL ] || printf 'R '"

alias ls='ls --color'
alias l='ls -l'
alias ll='ls --group-directories-first -lhA'
alias r='. ranger'
alias watch='watch '
alias sudo='sudo '
alias sc='systemctl'
alias blc='bluetoothctl'
