#!/bin/sh

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

cd $(dirname $0)

git --git-dir="$PWD/.git" submodule update -i

if [ ! -f ~/.zinit/zinit.zsh ]; then
    git clone https://github.com/zdharma/zinit.git ~/.zinit
fi

for i in \
	.nano \
	.zsh \
	.nanorc \
	.tmux.conf \
	.yaourtrc \
	.zshenv \
	.zshrc; do
	ln -sf ./.dotfiles/$i ~/$i
done
