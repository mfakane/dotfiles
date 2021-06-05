# fzf specific config

if (( $+commands[fzf] )); then

	source /usr/share/fzf/completion.zsh
	source /usr/share/fzf/key-bindings.zsh 

fi

# Show fzf if installed, otherwise use grep for querying.
function __suggest_if_fzf() {
	if (( $+commands[fzf] )); then
		local query=$([[ $# -ne 0 ]] && echo "-q $@")
		$(__fzfcmd) -e --height ${FZF_TMUX_HEIGHT:-40%} -1 $query
	else
		if [[ $# -ne 0 ]]; then
			grep $@
		else
			head -n 1
		fi
	fi
}

# ghq specific config

if (( $+commands[ghq] )); then

	function ghq-path() {
		if (( ! $+commands[fzf] && $# == 0 )); then
			ghq root
			return 0
		fi

		local repo_name=$(ghq list | __suggest_if_fzf $@)
		local fzf_result=$?
		[[ $fzf_result -ne 0 ]] && return $fzf_result

		if [[ -n "$repo_name" ]]; then
			for repo_root in $(ghq root --all); do
				local repo_path=$repo_root/$repo_name
				if [[ -d $repo_path ]]; then
					echo $repo_path
					return 0
				fi
			done
		fi

		return 1
	}

	function ghq-cd() {
		local ghq_path=$(ghq-path $@)
		local fzf_result=$?
		[[ $fzf_result -ne 0 ]] && return $fzf_result

		cd $ghq_path
	}

fi