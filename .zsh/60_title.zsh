autoload -Uz add-zsh-hook

case "$TERM" in
	kterm*|xterm*|tmux*)
		function _title_precmd() {
			local path=$(print -P "%(5~|%-1~/.../%3~|%4~)")
			echo -ne "\033]0;$USER@${(C)HOST}:$path\007"
		}

		add-zsh-hook precmd _title_precmd
		;;
esac
