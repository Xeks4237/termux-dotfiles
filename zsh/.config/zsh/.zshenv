#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# Order in which zsh sources its config files: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# This file is sources before everything by every instance of zsh
# Except instance of zsh runned through '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne Shell' like mode where it doesn't sources this file

# So you should put here stuff like environment variables which are should be set EVERYWHERE

# NOTE: This file is sourced my scripts launched with zsh too

# NOTE: For more about zsh see 'zshall' mandoc page

# [ Environment Variables generally needed ]
# NOTE: Using 'export' before setting variables matter!

# Vatiable which sets Locale/Language of system and tools
export LANG=en_US.UTF-8

# XDG configurations directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config/}"

# XDG data directory
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share/}"

# XDG bin directory
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin/}"

# XDG state directory
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state/}"

# XDG cache directory
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache/}"

# Set default editor which gonna be used by other apps
export EDITOR="$PREFIX/bin/nvim"
export VISUAL="$PREFIX/bin/nvim"

# [ Environment Variables for Zsh ]
# Directory where files for zsh is present
# NOTE: If this variable is set then zsh gonna look for files like
# .zshrc, .zprofile and etc in $ZDOTDIR instead of $HOME directory
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/"

# [ Environment Variables for external tools ]
# Variable which sets directory for gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg/"

# Variable which sets location of ICEauthority file
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

# Variable which sets location for wine prefix directory
export WINEPREFIX="$XDG_DATA_HOME/wine/"

# Variable which sets location for per user cargo directory
export CARGO_HOME="$XDG_DATA_HOME/cargo/"

# Variable which sets location for per user go directory
export GOPATH="$XDG_DATA_HOME/go"

# Variables which set location for per user npm init module
export NPM_CONFIG_INIT_MODULE="${XDG_CONFIG_HOME:-$HOME/.config/}/npm/config/npm-init.js"
export npm_config_init_module="$NPM_CONFIG_INIT_MODULE"

# Variables which set location for per user npm cache directory
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME:-$HOME/.config/}/npm/"
export npm_config_cache="$NPM_CONFIG_CACHE"

# Variables which set location for per user npmrc file
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config/}/npm/npmrc"
export npm_config_userconfig="$NPM_CONFIG_USERCONFIG"

# Variable used by fzf to define flags/options used by default
# NOTE: fzf-tab plugin for zsh uses it too if enabled
export FZF_DEFAULT_OPTS='
--multi
--extended
--style=full:rounded
--layout=reverse
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8
--color=selected-bg:#45475A
--color=border:#6C7086,label:#CDD6F4
'

