# [ Keybindings ]
# Enable vi style keymaps
bindkey -v

# Sets Home key to move cursor to the beginning of line
bindkey "\e[H" beginning-of-line
bindkey "^[[1~" beginning-of-line

# Sets End key to move cursor to the beginning of line
bindkey "\e[F" end-of-line
bindkey "^[[4~" end-of-line

# Map down arrow key to open fzf history search
# bindkey "\e[B" fzf-history-widget

# Fish like history search/suggestions
bindkey "\e[A" history-substring-search-up
bindkey "\e[B" history-substring-search-down

# Sets PageDown key to open fzf history search widget
bindkey "\e[6~" fzf-history-widget

# etc
bindkey "\ew" kill-region
bindkey "\e[3~" delete-char
