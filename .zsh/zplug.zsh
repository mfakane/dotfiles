zplug "zplug/zplug"

zplug "~/.zsh", from:local, defer:1, use:"<->_*.zsh"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
	bindkey "^[[A" history-substring-search-up
	bindkey "^[[B" history-substring-search-down

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "hlissner/zsh-autopair", defer:3
