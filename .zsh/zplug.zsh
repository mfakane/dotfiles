zplug "zplug/zplug"

zplug "~/.zsh", from:local, nice:2, use:"<->_*.zsh"

zplug "sindresorhus/pretty-time-zsh", as:command
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
	POWERLEVEL9K_MODE="awesome-patched"
	POWERLEVEL9K_PROMPT_ON_NEWLINE=true
	POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
	POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} %(!.#.$) %f%k\uE0B0  "
	POWERLEVEL9K_STATUS_VERBOSE=false
	
	POWERLEVEL9K_CUSTOM_CMD_DURATION="custom_cmd_duration"
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_cmd_duration)
	
	PROMPT2=`echo "%K{white}%F{black} %_ %f%k\uE0B0 "`
	
	function custom_cmd_duration() {
		pretty-time.zsh "$CUSTOM_9K_DURATION"
	}
	
	function preexec() {
		CUSTOM_9K_TIMER=${timer:-$SECONDS}
	}
	
	function precmd() {
		if [[ $CUSTOM_9K_TIMER ]]; then
			CUSTOM_9K_DURATION=$(($SECONDS - $CUSTOM_9K_TIMER))
			unset CUSTOM_9K_TIMER
		fi
	}

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "hlissner/zsh-autopair", nice:11
