#!/bin/sh

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

if [[ ! -f ~/.zgen/zgen.zsh ]]; then
	git clone https://github.com/tarjoilija/zgen ~/.zgen
fi
