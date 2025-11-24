# [ Environment Variables ]

# Language
LANG=ru_RU.UTF-8

# XDG configurations directory
XDG_CONFIG_HOME="$HOME/.config/"

# XDG local data directory
XDG_DATA_HOME="$HOME/.local/share"

# XDG cache directory
XDG_CACHE_HOME="$HOME/.cache/"

# PATH
PATH=$PATH:$HOME/.local/bin:$HOME/Scripts

# Auto exit/close Terminal after closing zellij
ZELLIJ_AUTO_EXIT=true

# Auto attach to the zellij session if available, else create new session
ZELLIJ_AUTO_ATTACH=false

# fzf default options file
export FZF_DEFAULT_OPTS_FILE=$XDG_CONFIG_HOME/fzf/fzf-options

# Set default editor which gonna be used by other apps
EDITOR="nvim"
VISUAL="nvim"

# Max length of zsh command history
HISTSIZE=10000

# Location of zsh-history file
HISTFILE=$XDG_CONFIG_HOME/zsh/zsh-history

# Sets max length of SAVED command history to the max length of command history
SAVEHIST=$HISTSIZE

# Set the directory where we want to store zinit plugin manager and plugins for zsh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

