source .aliasrc
source .envrc

# for wonky terminals over ssh
export TERM=xterm-256color

r_cmd='[ -z $RANGER_LEVEL ] || printf "R "'
PS1='$('"$r_cmd"')\[\e[1;34m\]\u\[\e[0m\]@\h \w % '
PROMPT_DIRTRIM=2
