autoload -Uz add-zsh-hook

case "$TERM" in
	kterm*|xterm*|screen*|tmux*)
		function _title() {
			local dir=$(print -P "%(5~|%-1~/.../%3~|%4~)")
			local userhost="$USER@${(C)HOST/.*}"

			echo -n "$userhost:$dir"
		}
		
		function _title_precmd() {
			echo -ne "\033]0;$(_title)\007"
		}

		function _title_preexec() {
			echo -ne "\033]0;$(_title) - $1\007"
		}

		add-zsh-hook precmd _title_precmd
		add-zsh-hook preexec _title_preexec
		;;
esac
