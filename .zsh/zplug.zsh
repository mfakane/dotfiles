zplug "zplug/zplug"

zplug "~/.zsh", from:local, nice:2, use:"<->_*.zsh"

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
	POWERLEVEL9K_MODE="awesome-patched"
	POWERLEVEL9K_PROMPT_ON_NEWLINE=true
	POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
	POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} %(!.#.$) %f%k\uE0B0  "
	POWERLEVEL9K_STATUS_VERBOSE=false
	PROMPT2=`echo "%K{white}%F{black} %_ %f%k\uE0B0 "`

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "hlissner/zsh-autopair", nice:11

