. $XDG_LIB_HOME/dotfiles/includes/shellname.sh

if type direnv &> /dev/null; then
	eval "$(direnv hook $SHELL_NAME)"
fi
