#!/usr/bin/env bash

set -xeu

archive=$HOME/.cache/archive.tar

populate_files=(.aliasrc .bash_profile .bashrc .config/htop/htoprc .config/ranger/rc.conf .config/ranger/rifle.conf .envrc .hushlogin .inputrc .profile .ssh/config .vim/defaults.vim .vim/keymap/russian-jcukenwin-custom.vim .vim/pack/tpope/start/sensible/plugin/sensible.vim .vim/skel/c .vim/skel/cpp .vim/skel/html .vim/skel/markdown .vim/skel/python .vim/skel/sh .vim/vimrc .local/bin/open-text.sh)

usage()
{
    echo "Usage: $0 <command> [arguments]"
    echo "supported commands:"
    echo "  ssh <host>"
}

[ "$#" -lt 1 ] && { usage; exit 1; }
[ -z "$1" ] && { usage; exit 1; }

[ "$1" = "ssh" ] || { usage; exit 2; }
[ "$#" -lt 2 ] && { usage; exit 2; }
[ -z "$2" ] && { usage; exit 2; }
host="$2"

pushd $HOME
tar -cf $archive ${populate_files[@]}
ln -sf ../../.ranger/ranger.py $HOME/.local/bin/ranger
tar -rf $archive .ranger .local/bin/ranger
rm .local/bin/ranger
gzip -f $archive
archive="$archive.gz"
ssh $host mkdir -p .cache
scp -O $archive $host:.cache
ssh $host tar -xf .cache/$(basename $archive)
popd
