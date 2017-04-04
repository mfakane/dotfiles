source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
	zgen load "zsh-users/zsh-completions"
	#zgen load "zsh-users/zsh-autosuggestions"
	zgen load "zsh-users/zsh-syntax-highlighting"
	zgen load "hlissner/zsh-autopair"
	zgen load "zsh-users/zsh-history-substring-search"

	zgen save
fi