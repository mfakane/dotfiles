#!/bin/sh

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

if [[ ! -f ~/.zinit/zinit.zsh ]]; then
	git clone https://github.com/zdharma/zinit.git ~/.zinit
fi
