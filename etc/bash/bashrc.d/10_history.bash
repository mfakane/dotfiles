# Ensure history directory exists
mkdir -p "$XDG_STATE_HOME/bash"

export HISTFILE="$XDG_STATE_HOME/bash/bash_history"
export HISTSIZE=10000
export SAVEHIST=10000

# No history when root
if [[ $UID == 0 ]]; then
	unset HISTFILE
	export SAVEHIST=0
fi
