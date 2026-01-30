#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# Order in which zsh sources its config files: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# This file is sources by 'interaactive' instances of zsh
# Its not the case if instance of zsh was runned through '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne Shell' like mode where it doesn't sources this file
# INFO: For more about zsh see 'zshall' mandoc page

# NOTE: So you should put here stuff which should be launched for every instance of zsh where you can type commands

# [ Environment Variables ]
# Path
export PATH="$PREFIX/bin/:$XDG_BIN_HOME:$HOME/Scripts/"

# Location of zsh history file
HISTFILE="$ZDOTDIR/.zsh_history"

# Max length of zsh command history
HISTSIZE=10000

# Sets max length of SAVED command history to the max length of command history
SAVEHIST="$HISTSIZE"

# Variable which sets style for command typo correction menu of zsh
SPROMPT="%F{$ZSH_THM_LAVENDER}zsh:%f %F{$ZSH_THM_YELLOW}correct '%f%F{$ZSH_THM_RED}%R%f%F{$ZSH_THM_YELLOW}' to '%f%F{$ZSH_THM_GREEN}%r%f%F{$ZSH_THM_YELLOW}'? [%f%F{$ZSH_THM_RED}n%f%F{$ZSH_THM_GREEN}y%f%F{$ZSH_THM_PEACH}a%f%F{$ZSH_THM_BLUE}e%f%F{$ZSH_THM_YELLOW}]:%f "

# [ Zsh Modules ]
# Load add-zsh-hook module, its a command which allows to add custom hooks to functions
autoload -U add-zsh-hook

# Load add-zsh-hook module, its a command which allows to add custom zle hooks to functions
autoload -U add-zle-hook-widget

# Load compinit module and initialize it, completions system of zsh
# NOTE: It needs to be loaded before plugin manager and plugins.
autoload -U compinit && compinit

# Builtin prompts/themes manager for managing custom prompts
autoload -U promptinit && promptinit

# Load zcompile module, command for compiling zsh scripts
autoload -U zcompile

# Builtin functions for detecting current vcs and info about it, needed for prompt
autoload -Uz vcs_info

# Builtin functions and expansions like '%F' for coloring stuff in terminal
autoload -U colors

# Load zmv module, command for advanced cp/mv/ln/.etc like stuff using regex patterns
autoload -U zmv

# Load zcalc module, builtin calculator in zsh which is more precise than you think XD
autoload -U zcalc

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
# Plugin files sourced from Oh-My-Zsh framework
zinit snippet OMZP::tmux
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

# Plugin which allows to autocomplete commands using text written in prompt, like in fish shell
zinit light 'zsh-users/zsh-history-substring-search'

# Fast syntax highlighting for zsh
zinit light 'zdharma-continuum/fast-syntax-highlighting'

# My customly made prompt
# zinit light 'Xeks4237/ZshGod'

# [ Extra commands for Zsh/Zinit plugins ]
# Choose/Set theme of fast-syntax-highlighting
fast-theme --quiet default

# Load and initialize completions related stuff for zinit
zinit cdreplay -q

# Load fish like history substring search plugin
zinit ice wait atload "_history_substring_search_config"

# Choose theme/prompt for zsh using builtin prompts manager
# prompt zshgod

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

# [ Prompt ]
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/zshgod/zshgod.plugin.zsh"

