#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# This file is sourced in '.zshrc'
# This file is meant for setting keymaps/keybindings of your interactive zsh instances
# And this file exists only for maintaining purposes

# [ Keymaps setted up using zkbd module of zsh ]
typeset -g -A key

key[F1]='^[OP'
key[F2]='^[OQ'
key[F3]='^[OR'
key[F4]='^[OS'
key[F5]='^[[15~'
key[F6]='^[[17~'
key[F7]='^[[18~'
key[F8]='^[[19~'
key[F9]='^[[20~'
key[F10]='^[[21~'
key[F11]='^[[23~'
key[F12]='^[[24~'
key[Backspace]='^?'
key[Insert]='^[[2~'
key[Home]='^[[1~'
key[PageUp]='^[[5~'
key[Delete]='^?'
key[End]='^[[4~'
key[PageDown]='^[[6~'
key[Up]='^[[A'
key[Left]='^[[D'
key[Down]='^[[B'
key[Right]='^[[C'

# [ Custom keymaps ]
# Enable vi style keymaps
bindkey -v

# Sets Home key to move cursor to the beginning of line
[[ -n ${key[Home]} ]] && bindkey ${key[Home]} beginning-of-line

# Same thing but for vi normal modes
[[ -n ${key[Home]} ]] && bindkey -M vicmd ${key[Home]} beginning-of-line

# Sets End key to move cursor to the beginning of line
[[ -n ${key[End]} ]] && bindkey ${key[End]} end-of-line

# Same thing but for vi normal mode
[[ -n ${key[End]} ]] && bindkey -M vicmd ${key[End]} end-of-line

# Sets Ctrl r to open fzf history search widget
bindkey '^r' fzf-history-widget

# Makes 'frontspace?' to delete 1 character after the cursor
# Its like 'backspace' but deletes character after the cursor rather then before
[[ -n ${key[Delete]} ]] && bindkey ${key[Delete]} delete-char

# Makes/Fixes backspace to work after returning to insert mode from normal mode
[[ -n ${key[Delete]} ]] && bindkey -M viins ${key[Delete]} backward-delete-char

# Simple function with Keymap to toggle termux wakelock state
# File where this state is stores globally to don't cause error while using multiple shells
export TERMUX_WAKE_LOCK_STATE_FILE="$XDG_DATA_HOME/termux/termux_wake_lock_state_file"
# Function to do logic related to wakelock
termux_wake_lock_toggle() {
    local termux_wake_lock_state=$(cat $TERMUX_WAKE_LOCK_STATE_FILE)
    if [[ $termux_wake_lock_state == 0 ]]; then
        termux-wake-lock
        zle -M 'zsh: WakeLock Acquired  '
        echo '1' > $TERMUX_WAKE_LOCK_STATE_FILE
    else
        termux-wake-unlock
        zle -M 'zsh: WakeLock Released  '
        echo '0' > $TERMUX_WAKE_LOCK_STATE_FILE
    fi
}
# Make zle widget from function
zle -N termux_wake_lock_toggle
# Bind this widget to 'Ctrl h'
bindkey '^h' termux_wake_lock_toggle

