# [ Keybindings ]

# Enable vi style keymaps
bindkey -v

# Sets Home key to move cursor to the beginning of line
bindkey "^[[H" beginning-of-line

# Sets End key to move cursor to the beginning of line
bindkey "^[[F" end-of-line

# Fish like history search/suggestions
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# etc
bindkey "^[w" kill-region
bindkey "^[[3~" delete-char
