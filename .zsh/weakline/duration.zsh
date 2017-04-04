WEAKLINE_DURATION_BACKGROUND=white
WEAKLINE_DURATION_FOREGROUND=black
WEAKLINE_DURATION=0

autoload -Uz add-zsh-hook

function _weakline_duration_preexec() {
	WEAKLINE_TIMER=${timer:-$SECONDS}
}

function _weakline_duration_precmd() {
	if [[ -n $WEAKLINE_TIMER ]]; then
		WEAKLINE_DURATION=$(($SECONDS - $WEAKLINE_TIMER))
		unset WEAKLINE_TIMER
	else
		WEAKLINE_DURATION=0
	fi
}

add-zsh-hook preexec _weakline_duration_preexec
add-zsh-hook precmd _weakline_duration_precmd

function weakline_duration() {
	local time=$WEAKLINE_DURATION
	
	local secs=$((time % 60))
	local mins=$((time / 60 % 60))
	local hours=$((time / 3600))
	
	secs="${secs}s"
	[[ $mins > 0 ]] && mins="${mins}m " || mins=""
	[[ $hours > 0 ]] && hours="${hours}h" || hours=""

	weakline_write_segment "$hours$mins$secs" $WEAKLINE_DURATION_BACKGROUND $WEAKLINE_DURATION_FOREGROUND
}
