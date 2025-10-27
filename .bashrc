source ~/.aliasrc
source ~/.envrc

# for wonky terminals over serial line
rsz() {
    old=$(stty -g)
    stty -echo
    printf '\033[18t'
    IFS=';' read -d t _ rows cols _
    stty "$old"
    stty cols "$cols" rows "$rows"
}
[ "$(tty)" = /dev/ttyS0 ] && trap rsz DEBUG

# for wonky terminals over ssh
export TERM=xterm-256color

r_cmd='[ -z $RANGER_LEVEL ] || printf "R "'
PS1='$('"$r_cmd"')\[\e[1;34m\]\u\[\e[0m\]@\h \w % '
PROMPT_DIRTRIM=2
