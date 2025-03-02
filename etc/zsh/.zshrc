. "$XDG_CONFIG_HOME/sh/interactive"

if [[ -d "$XDG_CONFIG_HOME/zsh/.zshrc.d" ]]; then
	for script in "$XDG_CONFIG_HOME/zsh/.zshrc.d/"*.zsh; do
		if [[ -r "$script" ]]; then
			. $script
		fi
		unset script
	done
fi

# bun completions
[ -s "/home/fumika/.bun/_bun" ] && source "/home/fumika/.bun/_bun"
