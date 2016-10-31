#!/bin/zsh

umask 022
limit coredumpsize 0
bindkey -d

if [[ -f ~/.zplug/init.zsh ]]; then
	export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"
	source ~/.zplug/init.zsh
	
	if ! zplug check --verbose; then
		zplug install
	fi
	
	zplug load
fi
