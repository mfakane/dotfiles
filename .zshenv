autoload -Uz colors; colors
autoload -Uz compinit; compinit -u

if [[ -f ~/.dircolors ]]; then
	eval `dircolors -b ~/.dircolors`
elif which dircolors > /dev/null 2>&1; then
	eval `dircolors -b`
fi

export EDITOR=nano
export LANG=ja_JP.UTF-8
export ZLE_RPROMPT_INDENT=0

export PATH="$HOME/bin:$PATH"

export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

if [[ $TERM =~ "-256color$" ]]; then
	export IS_256COLOR=true
else
	export IS_256COLOR=false
fi

# no history when root
if [[ $UID == 0 ]]; then
	unset HISTFILE
	export SAVEHIST=0
fi

[[ -f ~/.zshenv_local ]] && source ~/.zshenv_local
