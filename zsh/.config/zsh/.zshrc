#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# Order in which zsh sources its config files: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# This file is sources by 'interaactive' instances of zsh
# Its not the case if instance of zsh was runned through '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne Shell' like mode where it doesn't sources this file

# So you should put here stuff which should be launched for every instance of zsh where you can type commands

# NOTE: For more about zsh see 'zshall' mandoc page

# [ Environment Variables ]
# Path
PATH="$PREFIX/bin/:$XDG_BIN_HOME::$HOME/Scripts/"

# Location of zsh history file
HISTFILE="$ZDOTDIR/.zshistory"

# Max length of zsh command history
HISTSIZE=10000

# Sets max length of SAVED command history to the max length of command history
SAVEHIST="$HISTSIZE"

# Load compinit and initialize it if loaded successfully
autoload -Uz compinit && compinit

# [ Zsh Options ]
# NOTE: For more about zsh options see 'zshoptions' mandoc page
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/zshrc/options.zsh"

# [ Shell integrations with external tools ]
# fzf
eval "$(fzf --zsh)"

# gitleaks
eval "$(gitleaks completion zsh --verbose)"

# [ Environment variables for and Source/Load Zinit plugin manager ]
# Directory where Zinit plugin manager stores itself and its plugins for zsh
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share/}/zinit/zinit.git"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# [ Zsh/Zinit Snippets ] (Sourced remote/local files)
# Plugins sourced from Oh-My-Zsh framework
zinit snippet OMZP::tmux

# [ Zsh/Zinit Plugins ]
zinit light 'jeffreytse/zsh-vi-mode'
zinit light 'Aloxaf/fzf-tab'
zinit light 'zsh-users/zsh-completions'
zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zsh-users/zsh-history-substring-search'
zinit light 'zdharma-continuum/fast-syntax-highlighting'

# [ Extra commands for Zsh/Zinit plugins ]
# Choose/Set theme of fast-syntax-highlighting
fast-theme --quiet default

# Load and initialize completions related stuff for zinit
zinit cdreplay -q

# Load fish like history substring search plugin
zinit ice wait atload "_history_substring_search_config"

# [ Environment variables for Zsh/Zinit plugins ]
# zsh-vi-mode: Editor which is used when editing current command in editor
ZVM_VI_EDITOR=${EDITOR:-$VISUAL}

# zsh-vi-mode: Enables system clipboard support for zsh-vi-mode plugin
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# zsh-vi-mode: What commant plugin uses to send text to system clipboard
ZVM_CLIPBOARD_COPY_CMD="termux-clipboard-set"

# zsh-vi-mode: What commant plugin uses to get text from system clipboard
ZVM_CLIPBOARD_PASTE_CMD="termux-clipboard-get"

# zsh-vi-mode: Override the default open command
ZVM_OPEN_CMD='xdg-open'

# zsh-vi-mode: Override the open command for URLs
ZVM_OPEN_URL_CMD='termux-open-url'

# zsh-vi-mode: Override the open command for files
ZVM_OPEN_FILE_CMD='termux-open'

# zsh-vi-mode: Change to Zsh's default readkey engine
ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE

# zsh-vi-mode: Enable/Disable the cursor style feature
ZVM_CURSOR_STYLE_ENABLED=true

# zsh-vi-mode: Set the term variable of zsh-vi-mode to $TERM
ZVM_TERM=$TERM

# zsh-vi-mode: Set insert mode to be default one
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# NOTE: Environment variables for zsh-tmux plugin are set in .zprofile

# [ Zstyle options ]
# Makes completions to use half case-sensitive matching
# Like "foo" equals to "FOO", but "FOO" doesn't equals to "foo"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"

# Makes coloring for completions using ls color
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# Turns off completions menu, because its replaced with fzf-tab plugin
zstyle ":completion:*" menu select

# Makes fzf-tab plugin to use fzf options variables
# Some options can break plugin
# but after 4 years of using it I don't spotted any :3
zstyle ":fzf-tab:*" use-fzf-default-opts yes

# Enables fzf-tab completions for 'cd' command, and use 'ls' for preview
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --almost-all --human-readable --color=always $realpath"

# [ Keymaps/Keybindings ]
# Enable vi style keymaps
bindkey -v

# Sets Home key to move cursor to the beginning of line
bindkey "\e[H" beginning-of-line
bindkey "^[[1~" beginning-of-line

# Sets End key to move cursor to the beginning of line
bindkey "\e[F" end-of-line
bindkey "^[[4~" end-of-line

# Fish like history search/suggestions
# Arrow up to search up
bindkey "\e[A" history-substring-search-up
# Arrow down to search down
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
# Make zle widget from function
zle -N termux_wake_lock_toggle_widget termux_wake_lock_toggle
# Bind this widget to 'Ctrl h'
bindkey "^h" termux_wake_lock_toggle_widget

# Makes 'frontspace?' to delete 1 character after the cursor
# Its like 'backspace' but deletes character after the cursor rather then before
bindkey "\e[3~" delete-char

# [ Aliases ]
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/zshrc/aliases.zsh"

# [ Prompt ]
# NOTE: My zsh prompt is set and configured in different file only for maintaining purposes
source ${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/prompt.zsh

