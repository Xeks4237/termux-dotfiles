# INFO: This file is sourced by every instance of zsh

# [ Environment Variables ]
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

# XDG runtime directory
export XDG_RUNTIME_DIR="$TMPDIR"

# Path
# NOTE: $PREFIX/bin/ should always be at the start of path,
# $XDG_BIN_HOME should always be and the end of path
export PATH="$PREFIX/bin/:$CARGO_HOME/bin/:$XDG_BIN_HOME"

# Variable which sets Locale/Language of system and tools
export LANG='en_US.UTF-8'

# Set default editor which gonna be used by other apps
export EDITOR="$PREFIX/bin/nvim"
export VISUAL="$PREFIX/bin/nvim"

# Directory where files for zsh is present
# NOTE: If this variable is set then zsh gonna look for files like
# .zshrc, .zprofile and etc in $ZDOTDIR instead of $HOME directory
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/"

# Variable which sets directory for gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg/"

# Variable which sets location of ICEauthority file
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

# Variable which sets location for wine prefix directory
export WINEPREFIX="$XDG_DATA_HOME/wine/"

# Variable which sets location for per user cargo directory
export CARGO_HOME="$XDG_DATA_HOME/cargo/"

# Variable which sets location for per user go directory
export GOPATH="$XDG_DATA_HOME/go/"

# Variables which set location for per user npm init module
export NPM_CONFIG_INIT_MODULE="${XDG_CONFIG_HOME:-$HOME/.config/}/npm/config/npm-init.js"
export npm_config_init_module="$NPM_CONFIG_INIT_MODULE"

# Variables which set location for per user npm cache directory
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME:-$HOME/.config/}/npm/"
export npm_config_cache="$NPM_CONFIG_CACHE"

# Variables which set location for per user npmrc file
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config/}/npm/npmrc"
export npm_config_userconfig="$NPM_CONFIG_USERCONFIG"

# Variable which sets path to the config file for fzf
# NOTE: fzf-tab plugin for zsh uses it too if enabled
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME:-$HOME/.config/}/fzf/config"
