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

# Simple function with Keymap to toggle termux wakelock state
# File where this state is stores globally to don't cause error while using multiple shells
TERMUX_WAKE_LOCK_STATE_FILE="$XDG_DATA_HOME/termux/termux_wake_lock_state_file"
# Function to do logic related to wakelock
termux_wake_lock_toggle() {
    local termux_wake_lock_state=$(cat $TERMUX_WAKE_LOCK_STATE_FILE)
    if [[ $termux_wake_lock_state == 0 ]]; then
        termux-wake-lock
        echo "1" > $TERMUX_WAKE_LOCK_STATE_FILE
    else
        termux-wake-unlock
        echo "0" > $TERMUX_WAKE_LOCK_STATE_FILE
    fi
}
zle -N termux_wake_lock_toggle
bindkey "^h" termux_wake_lock_toggle

# etc
bindkey "\ew" kill-region
bindkey "\e[3~" delete-char
