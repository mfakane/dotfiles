typeset -gAH WEAKLINE_DIR_ICONS

if $IS_256COLOR; then
	WEAKLINE_DIR_ICONS=(
		HOME		"\b"
		HOME_SUB	"\b"
		FOLDER		"\b"
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
	#dir=(print -P "%(5~|.../%3~|%~)")
	local dir=$(print -P "%(5~|%-1~/.../%3~|%4~)")
	
	if $WEAKLINE_DIR_PRETTY && [[ $dir != "/" ]]; then
		[[ $dir == "/"* ]] && is_rooted=1 || is_rooted=0
		dir=${dir//\// $WEAKLINE_ICONS[LEFT_SUBSEPARATOR] }
		[[ $is_rooted != 0 ]] && dir="/$dir"
	fi
	
	if [[ $(print -P "%~") == "~" ]]; then
		icon=$WEAKLINE_DIR_ICONS[HOME]
	elif [[ $(print -P "%~") == "~"* ]]; then
		icon=$WEAKLINE_DIR_ICONS[HOME_SUB]
	fi
	
	weakline_write_segment "$icon $dir" $WEAKLINE_DIR_BACKGROUND $WEAKLINE_DIR_FOREGROUND	
}
