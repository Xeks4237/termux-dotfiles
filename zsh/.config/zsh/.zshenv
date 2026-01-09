# This file is sources by every instance of zsh
# Except instance of zsh runned in '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne shell' like mode

# [ Environment Variables ]
# Vatiable which sets Locale/Language of system and tool
LANG=en_US.UTF-8

# XDG configurations directory
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config/}"

# XDG data directory
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share/}"

# XDG bin directory
XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin/}"

# XDG state directory
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state/}"

# XDG cache directory
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache/}"

# Directory where files for zsh is present
ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/"

# Set default editor which gonna be used by other apps
EDITOR="$PREFIX/bin/nvim"
VISUAL="$PREFIX/bin/nvim"

# Variable which sets directory for gnupg
GNUPGHOME="$XDG_DATA_HOME/gnupg/"

# Variable which sets location for wine prefix directory
WINEPREFIX="$XDG_DATA_HOME/wine/"

# Location of zsh history file
HISTFILE="$ZDOTDIR/.zshistory"

# Max length of zsh command history
HISTSIZE=10000

# Sets max length of SAVED command history to the max length of command history
SAVEHIST="$HISTSIZE"

# Variable used by fzf to define flags/options used by default
# NOTE: fzf-tab plugin gor zsh uses it too if enabled
FZF_DEFAULT_OPTS='
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

# [ Variables for Zsh/Zinit plugins ]
# Set the directory where we want to store zinit plugin manager and plugins for zsh
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share/}/zinit/zinit.git"

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
# NOTE: I have it turned off because I have stuff related to it in my tmux config directly
ZSH_TMUX_FIXTERM=false

NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME/npm/config/npm-init.js"
NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"

GOPATH="$XDG_DATA_HOME/go/"

