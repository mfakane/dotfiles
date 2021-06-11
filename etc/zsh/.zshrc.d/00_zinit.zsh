if [[ -r "$XDG_CONFIG_HOME/zsh/zinit/zinit.zsh" ]]; then
	declare -A ZINIT
	ZINIT[BIN_DIR]="$XDG_CONFIG_HOME/zsh/zinit"
	ZINIT[HOME_DIR]="$XDG_CACHE_HOME/zinit"
	ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/zsh/zcompdump"

	. "$XDG_CONFIG_HOME/zsh/zinit/zinit.zsh"

	zinit ice blockf atpull'zinit creinstall -q .'
	zinit light zsh-users/zsh-completions

	zinit ice atload'_zsh_autosuggest_start'
	zinit light zsh-users/zsh-autosuggestions

	zinit ice atinit'zicompinit; zicdreplay'
	zinit light zdharma/fast-syntax-highlighting

	zinit light hlissner/zsh-autopair

	zinit light zsh-users/zsh-history-substring-search
fi
