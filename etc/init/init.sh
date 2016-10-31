#!/bin/sh

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

if [[ ! -f ~/.zplug/init.zsh ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
fi
