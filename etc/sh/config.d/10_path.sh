pathmunge() {
	PATH=$(echo "$PATH" | sed -E "s#(^|:)$1(:|\$)#:#g" | sed -E "s/^:|:$//g")

	if [ "$2" = "after" ]; then
		PATH="$PATH:$1"
	else
		PATH="$1:$PATH"
	fi
}

# Optware
[ -d "/opt/bin" ] && pathmunge "/opt/bin"

# asdf
if [ -d "$ASDF_DATA_DIR/shims" ]; then
	pathmunge "$ASDF_DATA_DIR/shims"
fi

# Set GOPATH to ~/repo if exists
if [ -d "$HOME/repos/src" ]; then
	export GOPATH="$HOME/repos"
	[ -d "$HOME/repos/src" ] && pathmunge "$HOME/repos/bin"
fi

pathmunge "$XDG_BIN_HOME"
pathmunge "$XDG_LIB_HOME/dotfiles/wrappers"

[ -d "/usr/local/sbin" ] && pathmunge "/usr/local/sbin" after
[ -d "/usr/sbin" ] && pathmunge "/usr/sbin" after
[ -d "/sbin" ] && pathmunge "/sbin" after

export PATH
unset -f pathmunge
