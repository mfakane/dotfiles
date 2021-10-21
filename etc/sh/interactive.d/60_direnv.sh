if type direnv &> /dev/null; then
	eval "$(direnv hook $(basename $SHELL))"
fi
