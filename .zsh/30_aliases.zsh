if (( $+commands[exa] )); then
	alias ls='exa -alFhg --git --group-directories-first'
else
	case "$OSTYPE" in
		darwin*)
			alias ls='ls -AlFhG'
			;;
		linux*)
			alias ls='ls -AlFh --group-directories-first --color=auto'
			;;
	esac
fi

if (( $+commands[bat] )); then
	alias cat='bat'
elif (( $+commands[batcat] )); then
	alias bat='batcat'
	alias cat='batcat'
fi

alias df='df -h'
alias free='free -h'
alias crontab='crontab -i'
alias jobs='jobs -l'
alias grep='grep --color=auto'
alias ssh='ssh -A'

if [[ -n $TMUX ]]; then
	function tmux-ssh() {
		local cmd="ssh -A $@"
		tmux neww -n "$*" "$cmd"
	}
	alias ssh='tmux-ssh'
	
	function tmux-nano() {
		local cmd="nano $@"
		tmux neww -n "$*" "$cmd"
	}
	alias nano='tmux-nano'
fi