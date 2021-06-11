. $XDG_LIB_HOME/dotfiles/includes/shellname.sh

_title() {
	local dir=$(print -P "%(5~|%-1~/.../%3~|%4~)")
	local userhost="$USER@${(C)HOST/.*}"

	echo -n "$userhost: $dir"
}

_title_precmd() {
	echo -ne "\033]0;$(_title)\007"
}

_title_preexec() {
	echo -ne "\033]0;$(_title) - $1\007"
}

case "$SHELL_NAME" in
	zsh)
		autoload -Uz add-zsh-hook
		add-zsh-hook precmd _title_precmd
		add-zsh-hook preexec _title_preexec
		;;
	*)
		starship_precmd_user_function=_title_precmd
		;;
esac

type starship &> /dev/null && eval "$(starship init $SHELL_NAME)"
