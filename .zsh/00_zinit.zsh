source "${HOME}/.zinit/zinit.zsh"

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# zinit ice atload'_zsh_autosuggest_start'
# zinit light zsh-users/zsh-autosuggestions

zinit ice atinit'zicompinit; zicdreplay'
zinit light zdharma/fast-syntax-highlighting

zinit light hlissner/zsh-autopair

zinit light zsh-users/zsh-history-substring-search
