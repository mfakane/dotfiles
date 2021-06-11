if [ -n "$TMUX" ]; then
	tmux-ssh() {
		tmux neww -n "$*" "ssh -A $@"
	}
	alias ssh='tmux-ssh'
	
	tmux-nano() {
		tmux neww -n "$*" "nano $@"
	}
	alias nano='tmux-nano'
fi
