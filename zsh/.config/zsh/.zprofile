#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# Order in which zsh sources its config files: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# This file is sources by login shell instance(s) of zsh
# Its not the case if instance of zsh was runned through '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne Shell' like mode where it doesn't sources this file
# INFO: For more about zsh see 'zshall' mandoc page

# NOTE: So you should put here stuff which should be launched only once on startup

# [ Environment Variables ]
# PATH
PATH="$PREFIX/bin/:$XDG_BIN_HOME:$HOME/Scripts/"

# [ Environment variables for Zsh/Zinit plugins ]
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

