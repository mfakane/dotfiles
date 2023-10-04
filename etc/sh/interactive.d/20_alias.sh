if type exa > /dev/null 2>&1; then
	alias ls='exa -alFhg --git --group-directories-first'
else
	case "$OSTYPE" in
		darwin*) alias ls='ls -AlFhG' ;;
		linux*) alias ls='ls -AlFh --group-directories-first --color=auto' ;;
	esac
fi

if type bat > /dev/null 2>&1; then
	alias cat='bat'
elif type batcat > /dev/null 2>&1; then
	alias bat='batcat'
	alias cat='batcat'
fi

type github-copilot-cli > /dev/null 2>&1 && eval "$(github-copilot-cli alias -- "$0")"

alias df='df -h'
alias free='free -h'
alias crontab='crontab -i'
alias jobs='jobs -l'
alias grep='grep --color=auto'
alias ssh='ssh -A'

# sudo alias for systems that don't use root as the name of the super user
if ! id root > /dev/null 2>&1; then
	alias sudo="sudo -u $(getent passwd 0 | cut -d: -f1)"
fi
