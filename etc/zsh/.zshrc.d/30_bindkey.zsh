bindkey -d

# Home
[[ -n "${terminfo[khome]}" ]] && bindkey "${terminfo[khome]}" beginning-of-line
bindkey "^[[H" beginning-of-line

# End
[[ -n "${terminfo[kend]}" ]] && bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[F" end-of-line

# Insert
[[ -n "${terminfo[kich1]}" ]] && bindkey "${terminfo[kich1]}" overwrite-mode
bindkey "^[[2~" overwrite-mode

# Delete
[[ -n "${terminfo[kdch1]}" ]] && bindkey "${terminfo[kdch1]}" delete-char
bindkey "^[[3~}" delete-char

# Page Up
[[ -n "${terminfo[kpp]}" ]] && bindkey "${terminfo[kpp]}" beginning-of-buffer-or-history
bindkey "^[[5~}" beginning-of-buffer-or-history

# Page Down
[[ -n "${terminfo[knp]}" ]] && bindkey "${terminfo[knp]}" end-of-buffer-or-history
bindkey "^[[6~}" end-of-buffer-or-history

# Esc
bindkey "^[" kill-whole-line

# Take 10ms for key sequences
KEYTIMEOUT=1

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# Disable C-s, C-q
setopt no_flow_control
