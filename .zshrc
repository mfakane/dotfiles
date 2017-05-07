#!/bin/zsh

umask 022
limit coredumpsize 0
bindkey -d

# enable Ctrl-S for keybinding
stty stop undef

for i in ~/.zsh/*.zsh; do
	source $i
done

[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local

true
