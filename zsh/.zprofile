# [ Environment Variables ]
# Language
LANG=ru_RU.UTF-8

# XDG configurations directory
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config/}"

# XDG data directory
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share/}"

# XDG state directory
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state/}"

# XDG cache directory
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache/}"

# PATH
PATH=$PATH:$HOME/.local/bin/:$HOME/Scripts/

# fzf default options file
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME:-$HOME/.config/}/fzf/fzf-options"

# Set default editor which gonna be used by other apps
EDITOR="$PREFIX/bin/nvim"
VISUAL="$PREFIX/bin/nvim"

# Set Esc key press timeout to 20
KEYTIMEOUT=20

# Max length of zsh command history
HISTSIZE=10000

# Location of zsh-history file
HISTFILE="${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/zsh-history"

# Sets max length of SAVED command history to the max length of command history
SAVEHIST=$HISTSIZE

# Set the directory where we want to store zinit plugin manager and plugins for zsh
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share/}/zinit/zinit.git"

# [ Variables for Zsh plugins ]
# zsh-vi-mode: Editor which is used when editing current command in editor
ZVM_VI_EDITOR=${EDITOR:-$VISUAL}

# zsh-vi-mode: Enables system clipboard support for zsh-vi-mode plugin
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# zsh-vi-mode: What commant plugin uses to send text to system clipboard
ZVM_CLIPBOARD_COPY_CMD="termux-clipboard-set"

# zsh-vi-mode: What commant plugin uses to get text from system clipboard
ZVM_CLIPBOARD_PASTE_CMD="termux-clipboard-get"

# OMZP::tmux: Automatically starts tmux
ZSH_TMUX_AUTOSTART=true

# OMZP::tmux: Autostart only if tmux hasn't been started previously
ZSH_TMUX_AUTOSTART_ONCE=true

# OMZP::tmux: Automatically connect to a previous session if it exits
ZSH_TMUX_AUTOCONNECT=true

# OMZP::tmux: Automatically closes terminal once tmux exits
ZSH_TMUX_AUTOQUIT=true

# OMZP::tmux: Path to tmux.conf file
ZSH_TMUX_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config/}/tmux/tmux.conf"

# OMZP::tmux: default session name when autostart for tmux is enabled
ZSH_TMUX_DEFAULT_SESSION_NAME="Termux, btw"

# OMZP::tmux: Automatically name new sessions using basename of $PWD
ZSH_TMUX_AUTONAME_SESSION=false

# OMZP::tmux: Sets $TERM to 256-color term or not based on current terminal support
# NOTE: I have it turned off because I have stuff related to it in my tmux config directly
ZSH_TMUX_FIXTERM=false

