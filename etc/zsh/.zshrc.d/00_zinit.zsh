if [[ -r "$XDG_CONFIG_HOME/zsh/zinit/zinit.zsh" ]]; then
	declare -A ZINIT
	ZINIT[BIN_DIR]="$XDG_CONFIG_HOME/zsh/zinit"
	ZINIT[HOME_DIR]="$XDG_CACHE_HOME/zinit"
	ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/zsh/zcompdump"

	. "$XDG_CONFIG_HOME/zsh/zinit/zinit.zsh"

	zinit ice wait lucid blockf atpull'zinit creinstall -q .'
	zinit light zsh-users/zsh-completions

	zinit ice wait lucid atload'_zsh_autosuggest_start'
	zinit light zsh-users/zsh-autosuggestions

	zinit ice wait lucid atinit'zicompinit; zicdreplay'
	zinit light zdharma-continuum/fast-syntax-highlighting

	zinit wait lucid light-mode for \
		hlissner/zsh-autopair \
		zsh-users/zsh-history-substring-search \
		chitoku-k/fzf-zsh-completions
fi
