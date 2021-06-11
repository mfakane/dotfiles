bindkey -d

# Home
bindkey '^[[H' beginning-of-line

# End
bindkey '^[[F' end-of-line

# Insert
bindkey '^[[2~' overwrite-mode

# Delete
bindkey '^[[3~' delete-char

# Page Up
bindkey '^[[5~' beginning-of-buffer-or-history

# Page Down
bindkey '^[[6~' end-of-buffer-or-history

# Esc
bindkey '^[' kill-whole-line

# Take 10ms for key sequences
KEYTIMEOUT=1

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# Disable C-s, C-q
setopt no_flow_control
