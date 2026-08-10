# INFO: This file is sources by login shell instance(s) of zsh

# Path
# NOTE: $PREFIX/bin/ should always be at the start of path,
# $XDG_BIN_HOME should always be and the end of path
export PATH="$PREFIX/bin/:$CARGO_HOME/bin/:$XDG_BIN_HOME"

# Start tmux session and exit after it stops
tmux new-session -As 'Termux, btw'; exit
