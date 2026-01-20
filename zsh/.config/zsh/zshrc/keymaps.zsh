#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# This file is sourced in '.zshrc'
# This file is meant for setting keymaps/keybindings of your interactive zsh instances
# And this file exists only for maintaining purposes

# Enable vi style keymaps
bindkey -v

# Sets Home key to move cursor to the beginning of line
bindkey '\e[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
# Same thing but for vi normal modes
bindkey -M vicmd '\e[H' beginning-of-line
bindkey -M vicmd '^[[1~' beginning-of-line

# Sets End key to move cursor to the beginning of line
bindkey '\e[F' end-of-line
bindkey '^[[4~' end-of-line
# Same thing but for vi normal modes
bindkey -M vicmd '\e[F' end-of-line
bindkey -M vicmd '^[[4~' end-of-line

# Fish like history search/suggestions
# Arrow up to search up
bindkey '\e[A' history-substring-search-up
# Arrow down to search down
bindkey '\e[B' history-substring-search-down

# Sets PageDown key to open fzf history search widget
bindkey '\e[6~' fzf-history-widget

# Makes 'frontspace?' to delete 1 character after the cursor
# Its like 'backspace' but deletes character after the cursor rather then before
bindkey '\e[3~' delete-char

# Makes/Fixes backspace to work after returning to insert mode from normal mode
bindkey -M viins '^?' backward-delete-char

# Simple function with Keymap to toggle termux wakelock state
# File where this state is stores globally to don't cause error while using multiple shells
export TERMUX_WAKE_LOCK_STATE_FILE="$XDG_DATA_HOME/termux/termux_wake_lock_state_file"
# Function to do logic related to wakelock
termux_wake_lock_toggle() {
    local termux_wake_lock_state=$(cat $TERMUX_WAKE_LOCK_STATE_FILE)
    if [[ $termux_wake_lock_state == 0 ]]; then
        termux-wake-lock
        echo '1' > $TERMUX_WAKE_LOCK_STATE_FILE
    else
        termux-wake-unlock
        echo '0' > $TERMUX_WAKE_LOCK_STATE_FILE
    fi
}
# Make zle widget from function
zle -N termux_wake_lock_toggle_widget termux_wake_lock_toggle
# Bind this widget to 'Ctrl h'
bindkey '^h' termux_wake_lock_toggle_widget

