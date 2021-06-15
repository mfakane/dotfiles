if type exa &> /dev/null; then
	alias ls='exa -alFhg --git --group-directories-first'
else
	case "$OSTYPE" in
		darwin*) alias ls='ls -AlFhG' ;;
		linux*) alias ls='ls -AlFh --group-directories-first --color=auto' ;;
	esac
fi

if type bat &> /dev/null; then
	alias cat='bat'
elif type batcat &> /dev/null; then
	alias bat='batcat'
	alias cat='batcat'
fi

alias df='df -h'
alias free='free -h'
alias crontab='crontab -i'
alias jobs='jobs -l'
alias grep='grep --color=auto'
alias ssh='ssh -A'

# QNAP Turbo NAS specific alias
case "$(uname -r)" in (*-qnap)
	alias sudo='sudo -u admin'
esac
