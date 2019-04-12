typeset -gAH WEAKLINE_VCS_ICONS

if $IS_256COLOR; then
	WEAKLINE_VCS_ICONS=(
		UNTRACKED		"\uE16C"
		UNSTAGED		"\uE17C"
		STAGED			"\uE168"
		STASH			"\uE133"
		INCOMING		"\uE131"
		OUTGOING		"\uE132"
		BRANCH			"\uE220"
		GIT				"\uE20E"
		SVN				"(svn)"
		HG				"\uE1C3"
	)
else
	WEAKLINE_VCS_ICONS=(
		UNTRACKED       "?"
		UNSTAGED        "!"
		STAGED          "+"
		STASH           "STASH:"
		INCOMING        "IN:"
		OUTGOING        "OUT:"
		BRANCH          "@"
		GIT             "(git)"
		SVN             "(svn)"
		HG              "(hg)"
	)
fi

WEAKLINE_VCS_BACKGROUND=green
WEAKLINE_VCS_CHANGED_BACKGROUND=yellow
WEAKLINE_VCS_ERROR_BACKGROUND=red
WEAKLINE_VCS_FOREGROUND=black

function weakline_vcs_git() {
	local git_status
	
	git_status=(${(f)"$(LANG=C git status --porcelain --branch 2> /dev/null)"})
	
	[[ $? != 0 ]] && return
	(( $#git_status < 1 )) && return
	
	local branch=${${git_status[1]:3}%...*}
	local ahead=${git_status[1]#*\[ahead }
	[[ $ahead[1] = <-> ]] && ahead=${ahead/\]*/}
	local behind=${git_status[1]#*\[behind }
	[[ $behind[1] = <-> ]] && behind=${behind/\]*/}
	shift git_status
	local untracked=${(M)#git_status:#\?\?*}
	local dirty=$(( $#git_status - $untracked ))
	
	WEAKLINE_VCS_1+=("$WEAKLINE_VCS_ICONS[GIT] " "$WEAKLINE_VCS_ICONS[BRANCH]$branch")

	[[ $ahead = <-> ]] && WEAKLINE_VCS_1+="$WEAKLINE_VCS_ICONS[OUTGOING]$ahead"
	[[ $behind = <-> ]] && WEAKLINE_VCS_1+="$WEAKLINE_VCS_ICONS[INCOMING]$behind"
	(( $untracked )) && WEAKLINE_VCS_1+="$WEAKLINE_VCS_ICONS[UNTRACKED]$untracked"
	
	if (( $dirty != 0 )); then
		local staged=${(M)#git_status:#[MADRCU]?*}
		local unstaged=${(M)#git_status:#?[MADRCU]*}
		
		(( $unstaged != 0 )) && WEAKLINE_VCS_2+="$WEAKLINE_VCS_ICONS[UNSTAGED]$unstaged"
		(( $staged != 0 )) && WEAKLINE_VCS_2+="$WEAKLINE_VCS_ICONS[STAGED]$staged"
	fi
}

function weakline_vcs() {
	local background=$WEAKLINE_VCS_BACKGROUND
	
	WEAKLINE_VCS_1=()
	WEAKLINE_VCS_2=()
	WEAKLINE_VCS_3=()
	
	weakline_vcs_git
	
	local message=($WEAKLINE_VCS_1)
	
	if (( $#WEAKLINE_VCS_2 > 0 )); then
		background=$WEAKLINE_VCS_CHANGED_BACKGROUND
		message+=($WEAKLINE_VCS_2)
	fi
	
	if (( $#WEAKLINE_VCS_3 > 0 )); then
		background=$WEAKLINE_VCS_ERROR_BACKGROUND
		message+=($WEAKLINE_VCS_3)
	fi
	
	(( $#message > 0 )) && weakline_write_segment "$message" $background $WEAKLINE_VCS_FOREGROUND
}
