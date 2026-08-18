# INFO: This file is sourced by every instance of zsh

# [ Environment Variables ]
# XDG configurations directory
typeset -gx XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config/}"

# XDG data directory
typeset -gx XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share/}"

# XDG bin directory
typeset -gx XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin/}"

# XDG state directory
typeset -gx XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state/}"

# XDG cache directory
typeset -gx XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache/}"

# XDG runtime directory
typeset -gx XDG_RUNTIME_DIR="$TMPDIR"

# Path
# NOTE: $PREFIX/bin/ should always be at the start of path,
# $XDG_BIN_HOME should always be and the end of path
typeset -gx PATH="$PREFIX/bin/:$CARGO_HOME/bin/:$XDG_BIN_HOME"

# Variable which sets Locale/Language of system and tools
typeset -gx LANG='en_US.UTF-8'

# Set default editor which gonna be used by other apps
typeset -gx EDITOR="$PREFIX/bin/nvim"
typeset -gx VISUAL="$PREFIX/bin/nvim"

# Directory where files for zsh is present
# NOTE: If this variable is set then zsh gonna look for files like
# .zshrc, .zprofile and etc in $ZDOTDIR instead of $HOME directory
typeset -gx ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/"

# Variable which sets directory for gnupg
typeset -gx GNUPGHOME="$XDG_DATA_HOME/gnupg/"

# Variable which sets location of ICEauthority file
typeset -gx ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

# Variable which sets location for wine prefix directory
typeset -gx WINEPREFIX="$XDG_DATA_HOME/wine/"

# Variable which sets location for per user cargo directory
typeset -gx CARGO_HOME="$XDG_DATA_HOME/cargo/"

# Variable which sets location for per user go directory
typeset -gx GOPATH="$XDG_DATA_HOME/go/"

# Variables which set location for per user npm init module
typeset -gx NPM_CONFIG_INIT_MODULE="${XDG_CONFIG_HOME:-$HOME/.config/}/npm/config/npm-init.js"
typeset -gx npm_config_init_module="$NPM_CONFIG_INIT_MODULE"

# Variables which set location for per user npm cache directory
typeset -gx NPM_CONFIG_CACHE="${XDG_CACHE_HOME:-$HOME/.config/}/npm/"
typeset -gx npm_config_cache="$NPM_CONFIG_CACHE"

# Variables which set location for per user npmrc file
typeset -gx NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config/}/npm/npmrc"
typeset -gx npm_config_userconfig="$NPM_CONFIG_USERCONFIG"
