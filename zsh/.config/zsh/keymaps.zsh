# [ Keybindings ]
# Enable vi style keymaps
bindkey -v

# Sets Home key to move cursor to the beginning of line
bindkey "^[[H" beginning-of-line

# Sets End key to move cursor to the beginning of line
bindkey "^[[F" end-of-line

# Map down arrow key to open fzf history search
# bindkey "^[[B" fzf-history-widget

# Fish like history search/suggestions
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Sets PageUp key to
# bindkey "^[[5~"

# Sets PageDown key to open fzf history search widget
bindkey "^[[6~" fzf-history-widget

# etc
bindkey "^[w" kill-region
bindkey "^[[3~" delete-char
