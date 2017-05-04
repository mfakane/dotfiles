typeset -gAH WEAKLINE_DIR_ICONS

if [[ $TERM == "xterm-256color" ]]; then
	WEAKLINE_DIR_ICONS=(
		HOME		"\uE12C"
		HOME_SUB	"\uE18D"
		FOLDER		"\uE818"
	)
	WEAKLINE_DIR_PRETTY=true
else
	WEAKLINE_DIR_ICONS=(
		HOME		"\b"
		HOME_SUB	"\b"
		FOLDER		"\b"
	)
	WEAKLINE_DIR_PRETTY=false
fi

WEAKLINE_DIR_BACKGROUND=blue
WEAKLINE_DIR_FOREGROUND=white

function weakline_dir() {
	local icon=$WEAKLINE_DIR_ICONS[FOLDER]
	#path=(print -P "%(5~|.../%3~|%~)")
	local path=$(print -P "%(5~|%-1~/.../%3~|%4~)")
	
	if $WEAKLINE_DIR_PRETTY && [[ $path != "/" ]]; then
		[[ $path == "/"* ]] && is_rooted=1 || is_rooted=0
		path=${path//\// $WEAKLINE_ICONS[LEFT_SUBSEPARATOR] }
		[[ $is_rooted != 0 ]] && path="/$path"
	fi
	
	if [[ $(print -P "%~") == "~" ]]; then
		icon=$WEAKLINE_DIR_ICONS[HOME]
	elif [[ $(print -P "%~") == "~"* ]]; then
		icon=$WEAKLINE_DIR_ICONS[HOME_SUB]
	fi
	
	weakline_write_segment "$icon $path" $WEAKLINE_DIR_BACKGROUND $WEAKLINE_DIR_FOREGROUND	
}
