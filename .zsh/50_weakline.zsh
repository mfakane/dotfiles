typeset -gAH WEAKLINE_ICONS
WEAKLINE_ICONS=(
	LEFT_SEPARATOR		"\uE0B0"
	LEFT_SUBSEPARATOR	"\uE0B1"
	RIGHT_SEPARATOR		"\uE0B2"
	RIGHT_SUBSEPARATOR	"\uE0B3"
)
WEAKLINE_SEGMENTS=(
	"weakline_beginprompt"
	"weakline_context"
	"weakline_dir"
	"weakline_vcs"
	"weakline_endprompt"
	"echo"
	"weakline_beginprompt"
	"weakline_indicator"
	"weakline_endprompt"
)
WEAKLINE_RSEGMENTS=(
	"weakline_beginprompt"
	"weakline_retval"
	"weakline_duration"
	"weakline_endprompt"
)

WEAKLINE_LAST_BACKGROUND=""
WEAKLINE_RETVAL=0

setopt prompt_subst
autoload -Uz add-zsh-hook

function _weakline_precmd() {
	WEAKLINE_RETVAL=$?
}

add-zsh-hook precmd _weakline_precmd

function weakline_write_segment() {
	if ! [[ -z $WEAKLINE_LAST_BACKGROUND ]]; then
		if [[ $WEAKLINE_ISRPROMPT != 0 ]]; then
			echo -n "%K{$WEAKLINE_LAST_BACKGROUND}%F{$2}${WEAKLINE_ICONS[RIGHT_SEPARATOR]}%f$k"
		else
			echo -n "%K{$2}%F{$WEAKLINE_LAST_BACKGROUND}${WEAKLINE_ICONS[LEFT_SEPARATOR]}%f$k"
		fi
	elif [[ $WEAKLINE_ISRPROMPT != 0 ]]; then
		echo -n "%F{$2}${WEAKLINE_ICONS[RIGHT_SEPARATOR]}%f"
	fi
	
	echo -n "%K{$2}%F{$3} $1 %f%k"
	WEAKLINE_LAST_BACKGROUND=$2
}

function weakline_beginprompt() {
	WEAKLINE_LAST_BACKGROUND=""
}

function weakline_endprompt() {
	if [[ $WEAKLINE_ISRPROMPT == 0 ]] && [[ -n $WEAKLINE_LAST_BACKGROUND ]]; then
		echo -n "%F{$WEAKLINE_LAST_BACKGROUND}${WEAKLINE_ICONS[LEFT_SEPARATOR]}%f"
	fi
}

for i in $(dirname $0)/weakline/*.zsh; do
	source $i
done

PROMPT="\$(WEAKLINE_ISRPROMPT=0;${(j:;:)WEAKLINE_SEGMENTS}) "
PROMPT2=`echo -n "%K{white}%F{black} %_ %f%k${WEAKLINE_ICONS[LEFT_SEPARATOR]} "`
RPROMPT=" \$(WEAKLINE_ISRPROMPT=1;${(j:;:)WEAKLINE_RSEGMENTS};WEAKLINE_ISRPROMPT=0)"