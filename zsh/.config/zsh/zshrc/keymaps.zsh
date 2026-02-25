#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# This file is sourced in '.zshrc'
# This file is meant for setting keymaps/keybindings of your interactive zsh instances
# And this file exists only for maintaining purposes

# [ Keymaps setted up using zkbd module of zsh ]
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}"

# [ Custom keymaps ]
# Enable vi style keymaps
bindkey -v

# Sets Home key to move cursor to the beginning of line
[[ -n ${key[Home]} ]] && bindkey ${key[Home]} beginning-of-line
bindkey '^[[1~' beginning-of-line

# Same thing but for vi normal modes
[[ -n ${key[Home]} ]] && bindkey -M vicmd ${key[Home]} beginning-of-line
bindkey -M vicmd '^[[1~' beginning-of-line

# Sets End key to move cursor to the beginning of line
[[ -n ${key[End]} ]] && bindkey ${key[End]} end-of-line
bindkey '^[[4~' end-of-line

# Same thing but for vi normal mode
[[ -n ${key[End]} ]] && bindkey -M vicmd ${key[End]} end-of-line
bindkey -M vicmd '^[[4~' end-of-line

# Sets Ctrl r to open fzf history search widget
bindkey '^r' fzf-history-widget

# Makes 'frontspace?' to delete 1 character after the cursor
# Its like 'backspace' but deletes character after the cursor rather then before
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char

# Makes/Fixes backspace to work after returning to insert mode from normal mode
[[ -n ${key[Backspace]} ]] && bindkey -M viins "${key[Backspace]}" backward-delete-char

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

