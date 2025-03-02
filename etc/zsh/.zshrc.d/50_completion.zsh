# Ensure history directory exists
mkdir -p "$XDG_CACHE_HOME/zsh"

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

setopt always_to_end
setopt auto_param_slash
setopt auto_remove_slash
setopt complete_aliases
setopt complete_in_word

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:options' description yes
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' use-cache true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
