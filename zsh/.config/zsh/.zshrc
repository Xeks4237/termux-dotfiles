#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# Order in which zsh sources its config files: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# This file is sources by 'interaactive' instances of zsh
# Its not the case if instance of zsh was runned through '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne Shell' like mode where it doesn't sources this file
# INFO: For more about zsh see 'zshall' mandoc page

# NOTE: So you should put here stuff which should be launched for every instance of zsh where you can type commands

# [ Zsh Modules ]
# Load add-zsh-hook module, its a command which allows to add custom hooks to functions
autoload -Uz add-zsh-hook

# Load add-zsh-hook module, its a command which allows to add custom zle hooks to functions
autoload -Uz add-zle-hook-widget

# Load compinit module and initialize it, completions system of zsh
# NOTE: It needs to be loaded before plugin manager and plugins.
autoload -Uz compinit && compinit

# Builtin prompts/themes manager for managing custom prompts
autoload -Uz promptinit && promptinit

# Builtin functions and expansions like '%F' for coloring stuff in terminal
autoload -Uz colors

# Load zmv module, command for advanced cp/mv/ln/.etc like stuff using regex patterns
autoload -Uz zmv

# Load zcalc module, builtin calculator in zsh which is more precise than you think XD
autoload -Uz zcalc

# Seperate file with zsh options
# NOTE: For more about zsh options see 'zshoptions' mandoc page
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/zshrc/options.zsh"

# [ Shell integrations with external tools ]
# fzf
eval "$(fzf --zsh)"

# gitleaks
eval "$(gitleaks completion zsh --verbose)"

# [ Source/Load Zinit plugin manager ]
# Variable which sets home directory of zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Snippet which bootstraps zinit
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# [ Zsh/Zinit Snippets ] (Sourced remote/local files)
# Tmux integration plugin from Oh-My-Zsh framework
zinit snippet OMZP::tmux

# Plugin for using going back to previous job by pressing Ctrl z
zinit snippet OMZP::fancy-ctrl-z

# [ Zsh/Zinit Plugins ]
# Plugin for fuzzy finding zsh completions
zinit light 'Aloxaf/fzf-tab'

# Extra completion styles for fzf-tab plugin
zinit light 'Freed-Wu/fzf-tab-source'

# Additional completion definitions for zsh
zinit light 'zsh-users/zsh-completions'

# Plugin which autosuggests completions based on command history
zinit light 'zsh-users/zsh-autosuggestions'

# Fast syntax highlighting for zsh
zinit light 'zdharma-continuum/fast-syntax-highlighting'

# My customly made prompt
zinit light 'Xeks4237/ZshGod'

# async library for zsh
zinit light 'mafredri/zsh-async'

# [ Extra commands for Zsh/Zinit plugins ]
# Choose/Set theme of fast-syntax-highlighting
fast-theme --quiet $ZDOTDIR/zshrc/custom-fsh-theme.ini

# Load and initialize completions related stuff for zinit
zinit cdreplay -q

# Load fish like history substring search plugin
zinit ice wait atload "_history_substring_search_config"

# Choose theme/prompt for zsh using builtin prompts manager
prompt zshgod --theme=catppuccin-mocha-arrows --min-exectime=5

# [ Environment variables for Zsh/Zinit plugins ]
# NOTE: Environment variables for zsh-tmux plugin are set in .zprofile too
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
ZSH_TMUX_DEFAULT_SESSION_NAME='Termux, btw'

# OMZP::tmux: Automatically name new sessions using basename of $PWD
ZSH_TMUX_AUTONAME_SESSION=false

# OMZP::tmux: Sets $TERM to 256-color term or not based on current terminal support
# NOTE: Don't use this variable if you have tmux configured anyway
ZSH_TMUX_FIXTERM=false

# [ Zstyle ]
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/zshrc/zstyle.zsh"

# [ Keymaps ]
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/zshrc/keymaps.zsh"

# [ Aliases ]
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/zshrc/aliases.zsh"

# [ Environment Variables ]
# Path
PATH="$PATH:$PREFIX/bin/:$XDG_BIN_HOME:$HOME/Scripts/"

# Location of zsh history file
HISTFILE="$ZDOTDIR/.zsh_history"

# Max length of zsh command history
HISTSIZE=10000

# Sets max length of SAVED command history to the max length of command history
SAVEHIST=$HISTSIZE

# Variable which sets style for command typo correction menu of zsh
SPROMPT="%F{#B4BEFE}zsh:%f %F{#F9E2AF}correct %f%F{#F38BA8}%R%f%F{#F9E2AF} to %f%F{#A6E3A1}%r%f%F{#F9E2AF}? [%f%F{#F38BA8}n%f%F{#A6E3A1}y%f%F{#FAB387}a%f%F{#89B4FA}e%f%F{#F9E2AF}]:%f"

# Variable which sets indentation for right side of prompt relative to terminal border
ZLE_RPROMPT_INDENT=0

