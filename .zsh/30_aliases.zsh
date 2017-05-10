alias ls='ls -AlFh --group-directories-first --color=auto'
alias df='df -h'
alias free='free -h'
alias crontab='crontab -i'
alias jobs='jobs -l'
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