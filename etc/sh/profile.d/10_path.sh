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
if [ -d "$XDG_OPT_HOME/asdf-vm" ]; then
	pathmunge "$XDG_OPT_HOME/asdf-vm/bin"
	pathmunge "$ASDF_DATA_DIR/shims"
fi

# vscode-server
if [ "${TERM_PROGRAM:-}" = "vscode" ]; then
	VSCODE_SERVER_BIN_DIR=$(eval "echo ~/.vscode-server/bin/*/bin" 2> /dev/null)
	if [ -d "$VSCODE_SERVER_BIN_DIR" ]; then
		pathmunge "$VSCODE_SERVER_BIN_DIR"
	fi
fi

# Homebrew
if [ -x "/opt/homebrew/bin/brew" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

pathmunge "$XDG_BIN_HOME"
pathmunge "$XDG_LIB_HOME/dotfiles/wrappers"

[ -d "/usr/local/sbin" ] && pathmunge "/usr/local/sbin" after
[ -d "/usr/sbin" ] && pathmunge "/usr/sbin" after
[ -d "/sbin" ] && pathmunge "/sbin" after

export PATH
unset -f pathmunge
