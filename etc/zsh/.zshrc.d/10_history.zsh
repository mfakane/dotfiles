# Ensure history directory exists
mkdir -p "$XDG_STATE_HOME/zsh"

setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history

export HISTFILE="$XDG_STATE_HOME/zsh/zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# No history when root
if [[ $UID == 0 ]]; then
	unset HISTFILE
	export SAVEHIST=0
fi
