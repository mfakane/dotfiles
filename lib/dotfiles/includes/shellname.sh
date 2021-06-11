if [ -n "$BASH" ]; then
	SHELL_NAME=$(basename $BASH)
elif [ -n "$ZSH_NAME" ]; then
	SHELL_NAME=$ZSH_NAME
else
	SHELL_NAME=$(basename $SHELL)
fi

IS_BASH=$([ "$SHELL_NAME" = "bash" ] && echo true || echo false)
IS_ZSH=$([ "$SHELL_NAME" = "zsh" ] && echo true || echo false)
