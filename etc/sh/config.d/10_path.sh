pathmunge() {
	case ":$PATH:" in
		*:"$1":*)
			;;
		*)
			if [ "$2" = "after" ]; then
				PATH="$PATH:$1"
			else
				PATH="$1:$PATH"
			fi
			;;
	esac
}

pathmunge "$XDG_BIN_HOME"
pathmunge "$XDG_LIB_HOME/dotfiles/wrappers"

[ -d "/usr/local/sbin" ] && pathmunge "/usr/local/sbin" after
[ -d "/usr/sbin" ] && pathmunge "/usr/sbin" after
[ -d "/sbin" ] && pathmunge "/sbin" after

export PATH
unset -f pathmunge
